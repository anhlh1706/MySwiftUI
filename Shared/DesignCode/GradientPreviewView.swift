//
//  GradientPreviewView.swift
//  MySwiftUI (iOS)
//
//  Created by Bym on 14/07/2022.
//

import SwiftUI

struct GradientPreviewView: View {
    @State var color = Color.blue
       @State var color2 = Color.purple

       var body: some View {
           VStack {
               ColorPicker("Color 1", selection: $color)
               ColorPicker("Color 2", selection: $color2)
               RoundedRectangle(cornerRadius: 30)
                   .fill(LinearGradient(gradient: Gradient(colors: [color, color2]), startPoint: .topLeading, endPoint: .bottomTrailing))
           }
           .padding()
       }
}
