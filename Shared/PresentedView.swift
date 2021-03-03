//
//  PresentedView.swift
//  MySwiftUI
//
//  Created by Lê Hoàng Anh on 15/01/2021.
//

import SwiftUI

struct PresentedView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack {
            Text("Hello!")
                .frame(width: 300, height: 300)
                .background(Color.orange)
                .border(ImagePaint(image: Image("banner"), scale: 0.02), width: 30)
            
            Color(UIColor.clear)
                .frame(height: 30)
            
            Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}
