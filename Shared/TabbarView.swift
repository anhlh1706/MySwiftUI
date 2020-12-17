//
//  TabbarView.swift
//  MySwiftUI
//
//  Created by Lê Hoàng Anh on 23/12/2020.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        TabView {
            Text("First view")
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Home")
                }
            
            Text("Second view")
                .tabItem {
                    Image(systemName: "sun.max")
                    Text("Sun")
                }
            Text("Third view")
                .tabItem {
                    Image(systemName: "sun")
                    Text("Sun")
                }
        }
        
    }
}
