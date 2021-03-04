//
//  TabbarView.swift
//  MySwiftUI
//
//  Created by Lê Hoàng Anh on 23/12/2020.
//

import SwiftUI

struct TabbarView: View {
    
    @EnvironmentObject var global: Global
    
    var body: some View {
        TabView {
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
            
            DrawView()
                .tabItem {
                    Image(systemName: "sun.max")
                    Text("Sun")
                }
            
            AnimationView()
                .tabItem {
                    Image(systemName: "cloud")
                    Text("Cloud")
                }
        }
        .accentColor(global.primaryColor)
    }
}
