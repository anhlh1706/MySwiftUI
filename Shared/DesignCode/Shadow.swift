//
//  Shadow.swift
//  DesignCode
//
//  Created by Bym on 13/07/2022.
//

import SwiftUI

struct ShadowView: View {
    var body: some View {
        VStack {
            ZStack {
                Color.white
                
                VStack {
                    Text("App of the day")
                        .font(.title).bold()
                        .foregroundColor(.white)
                        .shadow(radius: 20)
                }
                .frame(width: 300, height: 200)
                .background(Color.pink)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                .shadow(color: Color.pink.opacity(0.3), radius: 20, x: 0, y: 10)
                .mask(Color.black.opacity(0.3))
            }
            
            if #available(iOS 16, *) {
                Text("App of the day")
                    .font(.title).bold()
                    .foregroundColor(.white)
                    .shadow(radius: 20)
                    .overlay(content: {
                        Circle()
                            .fill(.pink.shadow(.drop(color: .black.opacity(0.5), radius: 10)))
                            .frame(width: 300, height: 200)
                    })
            }
            
            Spacer()
        }
    }
}

struct ShadowView_Previews: PreviewProvider {
    static var previews: some View {
        ShadowView()
    }
}
