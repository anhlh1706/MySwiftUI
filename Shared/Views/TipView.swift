//
//  TipView.swift
//  MySwiftUI
//
//  Created by Lê Hoàng Anh on 29/12/2020.
//

import SwiftUI

struct TipView: View {
    
    let tips: [Tip]
    
    init() {
        let bundle = Bundle.main.url(forResource: "tips", withExtension: "json")!
        tips = try! JSONDecoder().decode([Tip].self, from: Data(contentsOf: bundle))
    }
    
    var body: some View {
        List(tips, id: \.text, children: \.children) { tip in
            Text(tip.text)
        }
        .navigationTitle(Text("Tips"))
    }
}
