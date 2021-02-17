//
//  PrimaryButtonModifier.swift
//  MySwiftUI
//
//  Created by Lê Hoàng Anh on 01/02/2021.
//

import SwiftUI

struct PrimaryButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.red)
            .foregroundColor(Color.white)
            .clipShape(Circle())
    }
}
