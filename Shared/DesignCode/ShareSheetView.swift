//
//  ShareSheetView.swift
//  MySwiftUI (iOS)
//
//  Created by Bym on 18/07/2022.
//

import SwiftUI

struct ShareSheetView: View {
    var body: some View {
        Button(action: {
            let url = URL(string: "https://github.com/anhlh1706")
            let activityController = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
            
            UIApplication.shared.keyWindow?.rootViewController!.present(activityController, animated: true, completion: nil)
        }) {
            Image(systemName: "square.and.arrow.up")
                .foregroundColor(.black)
        }
    }
}

struct ShareSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ShareSheetView()
    }
}
