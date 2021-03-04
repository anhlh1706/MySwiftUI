//
//  GridView.swift
//  MySwiftUI
//
//  Created by Lê Hoàng Anh on 03/03/2021.
//

import SwiftUI

struct GridView: View {
    
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ] // Fix number of columns
    
    var secondColumns = [
        GridItem(.adaptive(minimum: 80))
    ] // Fix width of item
    
    var rows = [
        GridItem(.fixed(70))
    ]
    
    var body: some View {
        ScrollView {
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows) {
                    ForEach(0..<15) {
                        Text(String($0))
                            .frame(width: 70)
                    }
                }
            }
            LazyVGrid(columns: columns) {
                ForEach(0..<100) {
                    Text(String($0))
                        .frame(height: 40)
                }
            }
            LazyVGrid(columns: secondColumns) {
                ForEach(0..<100) {
                    Text(String($0))
                        .frame(height: 40)
                }
            }
        }
    }
}
