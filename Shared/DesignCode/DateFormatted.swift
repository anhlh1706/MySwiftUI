//
//  DateFormatted.swift
//  MySwiftUI (iOS)
//
//  Created by Bym on 20/07/2022.
//

import SwiftUI

struct DateFormatted: View {
    
    let date = Date()
    
    var body: some View {
        VStack {
            Text(date.formatted())
            
            Text(date.formatted(.dateTime.day().month().year()))
            Text(date.formatted(.dateTime.day().month()))
            
            Text(date.formatted(.dateTime.month()))
            Text(date.formatted(.dateTime.month(.wide)))
            
            Text(date.formatted(.dateTime.weekday()))
            Text(date.formatted(.dateTime.weekday(.wide)))
            
            Text(date.formatted(.dateTime.day()))
        }
    }
}

struct DateFormatted_Previews: PreviewProvider {
    static var previews: some View {
        DateFormatted()
    }
}
