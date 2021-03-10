//
//  ContributionsGraphView.swift
//  MySwiftUI (iOS)
//
//  Created by Lê Hoàng Anh on 10/03/2021.
//

import SwiftUI

struct ContributionsGraphView: View {
    
    static let boxSize: CGFloat = 15
    static let spacing: CGFloat = 4
    
    private let rows = Array(
        repeating: GridItem(.fixed(boxSize), spacing: spacing),
        count: 7
    )
    
    let days: [DevelopmentDay]
    let selectedDay: (DevelopmentDay) -> Void
    
    func GithubColor(for count: Int) -> Color {
        if count > 15 {
            return Color(red: 0.128, green: 0.428, blue: 0.222)
        } else if count > 10 {
            return Color(red: 0.192, green: 0.632, blue: 0.305)
        } else if count > 5 {
            return Color(red: 0.255, green: 0.768, blue: 0.391)
        } else if count > 0 {
            return Color(red: 0.606, green: 0.914, blue: 0.661)
        }
        return Color(.secondarySystemBackground)
    }
    
    var body: some View {
        LazyHGrid(rows: rows, spacing: Self.spacing) {
            ForEach(days, id: \.date) { day in
                GithubColor(for: day.dataCount)
                    .frame(width: Self.boxSize, height: Self.boxSize)
                    .cornerRadius(2)
                    .onTapGesture {
                        selectedDay(day)
                    }
            }
        }
        .padding()
    }
}

struct GithubView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            ContributionsGraphView(
                days: viewModel.days,
                selectedDay: { viewModel.selectedDay = $0 }
            )
            
            if let selectedDay = viewModel.selectedDay {
                Text("You made \(selectedDay.dataCount) contributions on\n \(formatter.string(from: selectedDay.date))")
                    .multilineTextAlignment(.center)
            }
        }
    }
}

extension GithubView {
    
    class ViewModel: ObservableObject {
        
        @Published var days = [DevelopmentDay]()
        @Published var selectedDay: DevelopmentDay?
        
        init() {
            getDevelopmentDays()
        }
        
        
        func getDevelopmentDays() {
            GithubParser.getDevelopmentDays(for: "anhlh1706") { [weak self] days in
                self?.days = days
            }
        }
    }
}
