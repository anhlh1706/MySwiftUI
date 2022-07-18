//
//  LoadingAnimView.swift
//  MySwiftUI (iOS)
//
//  Created by Bym on 18/07/2022.
//

import SwiftUI

struct LoadingAnimView: View  {
    @State var appear = false

    var body: some View {
        Circle()
            .trim(from: 0.2, to: 1)
            .stroke(Color.blue, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
            .frame(width: 44, height: 44)
            .rotationEffect(Angle(degrees: appear ? 360 : 0))
            .animation(Animation.linear(duration: 1.2).repeatForever(autoreverses: false), value: appear)
            .onAppear {
                appear = true
            }
    }
}

struct LoadingAnimView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingAnimView()
    }
}
