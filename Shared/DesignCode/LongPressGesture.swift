//
//  LongPressGesture.swift
//  DesignCode
//
//  Created by Bym on 13/07/2022.
//

import SwiftUI

struct LongPressGestureView: View {
    @GestureState var press = false
    @State var show = false
    
    var body: some View {
        Image(systemName: "camera.fill")
            .foregroundColor(.white)
            .frame(width: 60, height: 60)
            .background(show ? Color.black : Color.blue)
            .mask(Circle())
            .scaleEffect(press ? 2 : 1)
            .animation(.spring(response: 0.4, dampingFraction: 0.6), value: show)
            .gesture(
                LongPressGesture(minimumDuration: 0.5)
                    .updating($press) { currentState, gestureState, transaction in
                        gestureState = currentState
                    }
                    .onEnded { value in
                        show.toggle()
                    }
            )
    }
}

struct LongPressGestureView_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureView()
    }
}
