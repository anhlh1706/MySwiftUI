//
//  Global.swift
//  MySwiftUI
//
//  Created by Lê Hoàng Anh on 03/03/2021.
//

import Foundation
import SwiftUI

class Global: ObservableObject {
    
    var primaryColor: Color = .pink { didSet { update() } }
    
    var percent = 1 { didSet { update() } }
    
    private func update() {
        objectWillChange.send()
    }
}
