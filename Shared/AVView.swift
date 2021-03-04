//
//  AVView.swift
//  MySwiftUI
//
//  Created by Lê Hoàng Anh on 03/03/2021.
//

import SwiftUI
import AVKit

struct AVView: View {
    var body: some View {
        VideoPlayer(player: AVPlayer(url: URL(string: "https://vod-progressive.akamaized.net/exp=1614841229~acl=%2A%2F1123020046.mp4%2A~hmac=eb0d23bd8ee50594f1db0756ccbb5a7f03001e50a7f0100df7855a35ff37a6fc/vimeo-prod-skyfire-std-us/01/4047/11/295238750/1123020046.mp4?filename=What+Star+Wars+Can+Teach+Us+About+Swift.mp4")!)) {
            Text("Hello, world!")
                .padding()
                .font(.largeTitle)
                .background(Color.black.opacity(0.8))
        }
        .ignoresSafeArea()
    }
}
