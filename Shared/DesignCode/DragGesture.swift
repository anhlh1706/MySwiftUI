//
//  DragGesture.swift
//  DesignCode
//
//  Created by Bym on 13/07/2022.
//

import SwiftUI

struct DragGestureView: View {
    @State var viewState = CGSize.zero

       var body: some View {
           RoundedRectangle(cornerRadius: 30)
               .fill(Color.blue)
               .frame(width: 300, height: 400)
               .offset(x: viewState.width, y: viewState.height)
               .gesture(
                   DragGesture().onChanged { value in
                       viewState = value.translation
                   }
                   .onEnded { value in
                       withAnimation(.spring()) {
                           viewState = .zero
                       }
                   }
               )
       }
}

struct DragGestureView_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureView()
    }
}
