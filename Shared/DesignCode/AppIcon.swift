//
//  AppIcon.swift
//  MySwiftUI (iOS)
//
//  Created by Lê Hoàng Anh on 15/11/2022.
//

import SwiftUI

struct AppIconView: View {
    var body: some View {
        Image("appIconBG")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .mask(
                Text("Bym")
                    .font(.system(size: 190))
                    .fontWeight(.bold)
            )
            .frame(width: 480, height: 480)
    }
}

struct AppIconView_Previews: PreviewProvider {
    static var previews: some View {
        AppIconView()
    }
}
