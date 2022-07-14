//
//  Animation.swift
//  DesignCode
//
//  Created by Bym on 13/07/2022.
//

import SwiftUI

struct DesignCodeAnimationView: View {
    @State var show = false

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .foregroundColor(.white)
                .frame(height: 300)
                .opacity(show ? 1 : 0.5)
                .padding(show ? 16 : 32)
                .offset(y: show ? 0 : 30)
                .animation(.spring(response: 0.5, dampingFraction: 0.4), value: show)
            RoundedRectangle(cornerRadius: 40)
                .frame(height: 300)
                .offset(y: show ? 600 : 0)
                .foregroundColor(.white)
                .shadow(radius: 40)
                .padding()
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8), value: show)
        }
        .onTapGesture {
            show.toggle()
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
