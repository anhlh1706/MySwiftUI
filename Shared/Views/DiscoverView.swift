//
//  ContentView.swift
//  Shared
//
//  Created by Lê Hoàng Anh on 16/12/2020.
//

import SwiftUI

struct DiscoverView: View {
    
    let location: Location
    
    var body: some View {
        ScrollView {
            Image(location.pictures[0])
                .resizable()
                .scaledToFit()
            
            Text(location.name)
                .font(.largeTitle)
                .bold()
            
            Text(location.country)
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(location.description)
                .padding(.top)
            
            Text("Did you know?")
                .font(.title3)
                .bold()
                .padding(.top)
            
            Text(location.more)
                .navigationTitle(Text("Discover"))
        }.padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DiscoverView(location: SharedLocation().primary)
        }
    }
}
