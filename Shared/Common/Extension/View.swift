//
//  View.swift
//  MySwiftUI (iOS)
//
//  Created by Bym on 18/07/2022.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
