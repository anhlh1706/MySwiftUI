//
//  Tip.swift
//  MySwiftUI
//
//  Created by Lê Hoàng Anh on 29/12/2020.
//

import Foundation

struct Tip: Decodable {
    let text: String
    let children: [Tip]?
}
