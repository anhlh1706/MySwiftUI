//
//  TermAndPrivacy.swift
//  MySwiftUI (iOS)
//
//  Created by Bym on 18/07/2022.
//

import SwiftUI

struct TermAndPrivacyView: View {
    
    @EnvironmentObject var global: Global
    
    @State var showSafari = false
    
    var body: some View {
        HStack(spacing: 0) {
            Text("You agree to our ")
            
            Text("Terms")
                .foregroundColor(global.primaryColor)
                .onTapGesture {
                    showSafari = true
                }
            
            Text(" and ")
            
            Text("Privacy policy")
                .foregroundColor(global.primaryColor)
                .onTapGesture {
                    UIApplication.shared.open(URL(string: "https://github.com/anhlh1706")!)
                }
            
            Text(".")
        }.fullScreenCover(isPresented: $showSafari, content: {
            SFSafariViewWrapper(url: URL(string: "https://github.com/anhlh1706")!)
        })
    }
}
