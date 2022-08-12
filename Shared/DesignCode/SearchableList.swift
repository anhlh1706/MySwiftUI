//
//  SearchableList.swift
//  MySwiftUI (iOS)
//
//  Created by Bym on 20/07/2022.
//

import SwiftUI

struct SearchableListView: View {
    
    @State private var searchText = ""
    
    let listString = "Everyone likes the weekend, it’s time to people do their work which they don’t have time to do in the weekdays."
        .components(separatedBy: " ")
    
    var filteredString: [String] {
        if searchText.isEmpty {
            return listString
        } else {
            return listString.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        List(filteredString, id: \.self) {
            Text($0)
        }
        .searchable(text: $searchText)
    }
}
