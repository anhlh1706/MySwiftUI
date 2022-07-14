//
//  LazyGridLayoutView.swift
//  MySwiftUI (iOS)
//
//  Created by Bym on 14/07/2022.
//

import SwiftUI

struct LazyGridLayoutView: View {
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [
                    GridItem(.fixed(100), spacing: 8),
                    GridItem(.fixed(160), spacing: 8),
                    GridItem(.fixed(80), spacing: 8)
                ], spacing: 12) {
                    
                    ForEach(0 ..< 30) { item in
                        Rectangle()
                            .frame(height: 80)
                    }
                }
        }
    }
}

struct LazyGridLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        LazyGridLayoutView()
    }
}
