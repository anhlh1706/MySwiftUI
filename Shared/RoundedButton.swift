//
//  RoundedButton.swift
//  MySwiftUI
//
//  Created by Lê Hoàng Anh on 16/12/2020.
//

import SwiftUI

struct RoundedButton: View {
    
    var title: String
    var color: Color = .white
    var radius: CGFloat = 10
    var action: (() -> Void)
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .font(.system(size: 20, weight: .medium))
                .frame(width: 280, height: 50)
                .background(Color.red)
                .foregroundColor(color)
                .cornerRadius(radius)
        })
    }
}
