//
//  ModalView.swift
//  MySwiftUI (iOS)
//
//  Created by Bym on 14/07/2022.
//

import SwiftUI

/// Present fullScreen
struct ModalView: View {
    @State var showModal = false

    var body: some View {
        Button(action: { showModal = true }) {
            Text("My Button")
        }
        .fullScreenCover(isPresented: $showModal) {
            ModalSubView()
        }
    }
}

struct ModalSubView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Text("Close Modal")
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
    }
}
