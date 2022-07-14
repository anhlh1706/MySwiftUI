//
//  Text.swift
//  DesignCode
//
//  Created by Bym on 13/07/2022.
//

import SwiftUI

struct ContentViewText: View {
    var body: some View {
        Text("This provides a consistent, legible, and friendly typographic voice.")
            .foregroundColor(.blue)
            .multilineTextAlignment(.trailing)
            .font(.custom("EduVICWANTBeginner-Regular", size: 20))
            .lineLimit(20)
            .lineSpacing(9)
            .frame(width: 200)
    }
}

struct ContentViewText_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewText()
    }
}
