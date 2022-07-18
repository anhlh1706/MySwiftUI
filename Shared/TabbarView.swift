//
//  TabbarView.swift
//  MySwiftUI
//
//  Created by Lê Hoàng Anh on 23/12/2020.
//

import SwiftUI

struct TabbarView: View {
    
    @EnvironmentObject var global: Global
    
    @State private var tappedTwice: Bool = false
    
    @State private var selectingTab = 0
    
    var body: some View {
        var handler: Binding<Int> { Binding(
            get: { selectingTab },
            set: {
                if $0 == selectingTab {
                    // Lands here if user tapped more than once
                    tappedTwice = true
                }
                selectingTab = $0
            }
        )}
        return ScrollViewReader { proxy in
            TabView(selection: handler) {
                GeometryReader { geo in
                    Image("banner")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width)
                }
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Home")
                }
                .tag(0)
                
                DrawView()
                    .onChange(of: tappedTwice, perform: { tapped in
                        if tapped {
                            withAnimation {
                                proxy.scrollTo(1)
                            }
                            tappedTwice = false
                        }
                    })
                    .tabItem {
                        Image(systemName: "sun.max")
                        Text("Sun")
                    }
                    .tag(1)
                
                AnimationView()
                    .tabItem {
                        Image(systemName: "cloud")
                        Text("Cloud")
                    }
                    .tag(2)
            }
            .accentColor(global.primaryColor)
        }
    }
}
