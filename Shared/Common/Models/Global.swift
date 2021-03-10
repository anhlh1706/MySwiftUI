//
//  Global.swift
//  MySwiftUI
//
//  Created by Lê Hoàng Anh on 03/03/2021.
//

import Foundation
import SwiftUI

var formatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .full
    return formatter
}()

class Global: ObservableObject {
    
    @Published var primaryColor: Color = .pink
    
    @Published var percent = 1
}
