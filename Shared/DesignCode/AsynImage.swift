//
//  AsynImage.swift
//  MySwiftUI (iOS)
//
//  Created by Bym on 20/07/2022.
//

import SwiftUI

struct AsynImageView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://salt.tikicdn.com/cache/w1200/ts/product/ef/ca/22/fe1e1bb1bfc0ba3f001ddf7853fc3ec3.jpg")) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            default:
                Image(systemName: "newspaper")
            }
        }
        .frame(width: 80, height: 80)
        .clipped()
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct AsynImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsynImageView()
    }
}
