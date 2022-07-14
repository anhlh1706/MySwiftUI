//
//  Shadow.swift
//  DesignCode
//
//  Created by Bym on 13/07/2022.
//

import SwiftUI

struct ShadowView: View {
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                Text("App of the day")
                    .font(.title).bold()
                    .foregroundColor(.white)
                    .shadow(radius: 20)
            }
            .frame(width: 300, height: 400)
            .background(Color.pink)
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
            .shadow(color: Color.pink.opacity(0.3), radius: 20, x: 0, y: 10)
            .mask(Color.black.opacity(0.3))
        }
        
    }
}

struct ShadowView_Previews: PreviewProvider {
    static var previews: some View {
        ShadowView()
    }
}
