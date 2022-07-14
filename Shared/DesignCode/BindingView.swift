//
//  BindingView.swift
//  MySwiftUI (iOS)
//
//  Created by Bym on 14/07/2022.
//

import SwiftUI

struct BindingView: View {
    
    @State var count = 0
    
    @State private var presentingModal = false
    
    var body: some View {
        VStack {
            Text(String(count))
            
            Button("To edit") {
                presentingModal = true
            }
        }
        .sheet(isPresented: $presentingModal) {
            Binding2ndView(count: $count)
        }
    }
}

private struct Binding2ndView: View {
    
    @Binding var count: Int
    
    var body: some View {
        Button("tap to increase") {
            count += 1
        }
    }
}
