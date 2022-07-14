//
//  Transition.swift
//  DesignCode
//
//  Created by Bym on 13/07/2022.
//

import SwiftUI

struct TransitionView: View {
    @State var show = false
    var body: some View {
        ZStack {
            if !show {
                Text("View Transition")
                    .padding()
                    .background(Capsule().stroke())
            } else {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.blue)
                    .padding()
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                show.toggle()
            }
        }
    }
}

struct TransitionView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionView()
    }
}
