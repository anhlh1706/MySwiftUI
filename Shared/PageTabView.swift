//
//  PageTabView.swift
//  MySwiftUI
//
//  Created by Lê Hoàng Anh on 04/03/2021.
//

import SwiftUI

struct PageTabView: View {
    
    @EnvironmentObject var percent: Global
    
    var body: some View {
        TabView {
            GeometryReader { geo in
                Image("banner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width)
            }
            
            DrawView()
            
            AnimationView()
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .accentColor(percent.primaryColor)
        .environmentObject(percent)
    }
}
