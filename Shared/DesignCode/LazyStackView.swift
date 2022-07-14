//
//  LazyStackView.swift
//  MySwiftUI (iOS)
//
//  Created by Bym on 14/07/2022.
//

import SwiftUI

/// With iOS 14, Apple gives you the ability to use lazy stacks in SwiftUI.
/// While HStack and VStack load the content right away,
/// LazyHStack and LazyVStack load the content as you scroll.

struct LazyStackView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(0 ..< 10000) { item in
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .frame(height: 100)
                        .shadow(radius: 100)
                }
            }
            .padding()
        }
    }
}

struct LazyStackView_Previews: PreviewProvider {
    static var previews: some View {
        LazyStackView()
    }
}
