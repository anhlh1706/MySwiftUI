//
//  AnimationView.swift
//  MySwiftUI
//
//  Created by Lê Hoàng Anh on 01/02/2021.
//

import SwiftUI

struct AnimationView: View {
    
    let greeting = Array("Hello, Mr.Lee!")
    
    @State private var dragAmount = CGSize.zero
    
    @State private var rotateValue: Double = 1
    
    @State private var zoomAmount: CGFloat = 1
    
    @State private var overlayZoomAmount: CGFloat = 1
    
    @State private var isBlue = false
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.orange]), startPoint: .top, endPoint: .bottomTrailing)
            
            VStack {
                HStack(spacing: 0) {
                    ForEach(0..<14) { index in
                        Text(String(greeting[index]))
                            .padding(3)
                            .font(.title)
                            .background(isBlue ? Color.blue : Color.red)
                            .offset(dragAmount)
                            .animation(Animation.default.delay(Double(index) / 20), value: dragAmount)
                    }
                }
                .gesture(
                    DragGesture()
                        .onChanged { dragAmount = $0.translation }
                        .onEnded { _ in
                            withAnimation(.spring()) {
                                dragAmount = .zero
                                isBlue.toggle()
                            }
                        }
                )
                
                Slider(value: $zoomAmount, in: 1...3)
                    .padding()
                
                Button("Tap") { }
                    .modifier(PrimaryButtonModifier())
                    .scaleEffect(zoomAmount) // scale
                    .blur(radius: (zoomAmount - 1) * 3) // blur view when zoom in
                    .animation(.easeOut, value: zoomAmount) // apply animate
                
                Spacer()
                
                Button("Tap") { }
                    .modifier(PrimaryButtonModifier())
                    .overlay(
                        Circle()
                            .stroke(Color.red)
                            .scaleEffect(overlayZoomAmount)
                            .opacity(Double(2 - overlayZoomAmount))
                            .animation(Animation.easeIn(duration: 1).repeatForever(autoreverses: false), value: overlayZoomAmount)
                    )
                    .onAppear(perform: {
                        overlayZoomAmount = 2
                    })
                
                Spacer()
                
                Button("Tap") {
                    withAnimation {
                        rotateValue += 1
                    }
                }
                .modifier(PrimaryButtonModifier())
                .rotation3DEffect(
                    .degrees(Double(rotateValue * 360)),
                    axis: (x: 0, y: 1, z: 0)
                )
                
                Spacer()
            }
            .onAppear(perform: {
                zoomAmount = 1
            })
        }
    }
}

