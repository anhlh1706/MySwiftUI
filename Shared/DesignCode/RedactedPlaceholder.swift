//
//  RedactedPlaceholder.swift
//  MySwiftUI (iOS)
//
//  Created by Bym on 14/07/2022.
//

import SwiftUI

struct RedactedPlaceholder: View {
    @State var isLoading = true

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            CardView()
                .redacted(reason: isLoading ? .placeholder : .init())
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isLoading = false
                    }
                }
        }
    }
}

private struct CardView: View {
    var body: some View {
         VStack(alignment: .leading, spacing: 16) {
             Image(uiImage: #imageLiteral(resourceName: "banner"))
                 .resizable().aspectRatio(contentMode: .fit)
                 .mask(Circle())
                 .frame(width: 44, height: 44)
             Text("Designing fluid interfaces")
                 .font(.title2).bold()
             Text("By Bymmm")
                 .font(.footnote).bold()
                 .foregroundColor(.secondary)
             Text("If you hate Viet Nam, then I feel sorry for you. Get your butt on an airplane and go see what you hate.")
                 .frame(maxWidth: .infinity, alignment: .leading)
                 .foregroundColor(.secondary)
             Spacer()
         }
         .padding()
         .frame(maxWidth: .infinity, maxHeight: 300)
         .background(Color(uiColor: .systemBackground))
         .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
         .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 40)
         .padding()
     }
}
