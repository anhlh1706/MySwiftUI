//
//  MySwiftUIApp.swift
//  Shared
//
//  Created by Lê Hoàng Anh on 16/12/2020.
//

import SwiftUI

@main
struct MySwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            MyTabbar()
        }
    }
}

struct MyTabbar: View {
    
    var locations = SharedLocation()
    
    var body: some View {
        TabView {
            NavigationView {
                DiscoverView(location: locations.primary)
            }
            .tabItem {
                Text("Discover")
                Image(systemName: "airplane.circle.fill")
            }
            
            NavigationView {
                WorldView()
            }
            .tabItem {
                Text("World")
                Image(systemName: "star.fill")
            }
            
            NavigationView {
                TipView()
            }
            .tabItem {
                Text("Tips")
                Image(systemName: "list.bullet")
            }
        }
        .environmentObject(locations)
    }
}
