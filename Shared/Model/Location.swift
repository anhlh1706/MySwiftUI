//
//  Location.swift
//  MySwiftUI
//
//  Created by Lê Hoàng Anh on 29/12/2020.
//

import Foundation
import Combine

struct Location: Decodable, Identifiable {
    let id: Int
    let name: String
    let country: String
    let description: String
    let more: String
    let latitude: Double
    let longitude: Double
    let pictures: [String]
    let advisory: String
}
