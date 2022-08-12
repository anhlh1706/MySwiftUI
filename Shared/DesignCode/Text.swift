//
//  Text.swift
//  DesignCode
//
//  Created by Bym on 13/07/2022.
//

import SwiftUI

struct ContentViewText: View {
    
    @EnvironmentObject var global: Global
    
    var attributedString: AttributedString {
        var attributedStr = AttributedString("Bym")
        
        var container = AttributeContainer()
        container.foregroundColor = global.primaryColor
        container.underlineStyle = .single
        
        attributedStr.mergeAttributes(container)
        
        return "My name is " + attributedStr
    }
    
    var body: some View {
        
        VStack(spacing: 30) {
            Text("This provides a consistent, legible, and friendly typographic voice.")
                .foregroundColor(.blue)
                .multilineTextAlignment(.trailing)
                .font(.custom("EduVICWANTBeginner-Regular", size: 20))
                .lineLimit(20)
                .lineSpacing(9)
                .frame(width: 200)
            
            Text(try! AttributedString(markdown: "Visit this [Github](https://github.com/anhlh1706/MySwiftUI) to see this project."))
            
            Text(attributedString)
        }
    }
}

struct ContentViewText_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewText()
    }
}
