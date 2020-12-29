//
//  SharedLocation.swift
//  MySwiftUI
//
//  Created by Lê Hoàng Anh on 29/12/2020.
//

import Foundation

final class SharedLocation: ObservableObject {
    
    let places: [Location]
    
    var primary: Location {
        places[0]
    }
    
    init() {
        let bundle = Bundle.main.url(forResource: "locations", withExtension: "json")!
        let data = try! Data(contentsOf: bundle)
        places = try! JSONDecoder().decode([Location].self, from: data)
        
    }
}
