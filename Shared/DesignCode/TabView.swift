//
//  TabView.swift
//  DesignCode
//
//  Created by Bym on 13/07/2022.
//

import SwiftUI

// PageViewController
struct TabViewView: View {
    @State var isThatBig = false
    var body: some View {
        TabView {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.blue)
                .padding()
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.red)
                .padding()
            RoundedRectangle(cornerRadius: isThatBig ? 200 : 30)
                .fill(Color.purple)
                .padding()
                .onTapGesture {
                    withAnimation(.spring()) {
                        isThatBig.toggle()
                    }
                }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))

    }
}

struct TabViewView_Previews: PreviewProvider {
    static var previews: some View {
        TabViewView()
    }
}
