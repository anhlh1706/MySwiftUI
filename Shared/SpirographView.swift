//
//  Spirograph.swift
//  MySwiftUI
//
//  Created by Lê Hoàng Anh on 17/02/2021.
//

import SwiftUI

struct SpirographView: View {
    
    @State private var innerRadius = 125.0
    @State private var outerRadius = 75.0
    @State private var distance = 25.0
    @State private var amount: CGFloat = 1
    @State private var hue = 0.6
    
    var body: some View {
        
        Spacer()
        
        Spirograph(innerRadius: Int(innerRadius), outerRadius: Int(outerRadius), distance: Int(distance), amount: CGFloat(amount))
            .stroke(Color(hue: hue, saturation: 1, brightness: 1), lineWidth: 1)
            .frame(width: 250, height: 250)
        
        Spacer()
        
        Group {
            Text("Inner radius: \(Int(innerRadius))")
                .modifier(ShortTextModifier())
            Slider(value: $innerRadius, in: 10...150, step: 1)
                .padding([.horizontal, .bottom])
            
            Text("Outer radius: \(Int(outerRadius))")
                .modifier(ShortTextModifier())
            Slider(value: $outerRadius, in: 1...150, step: 1)
                .padding([.horizontal, .bottom])
            
            Text("Distance: \(Int(distance))")
                .modifier(ShortTextModifier())
            Slider(value: $distance, in: 1...150, step: 1)
                .padding([.horizontal, .bottom])
            
            Text("Amount: \(amount, specifier: "%.2f")")
                .modifier(ShortTextModifier())
            Slider(value: $amount)
                .padding([.horizontal, .bottom])
            
            Text("Color")
                .modifier(ShortTextModifier())
            Slider(value: $hue)
                .padding([.horizontal, .bottom])
        }
        
        Spacer()
    }
}

struct Spirograph: Shape {
    let innerRadius: Int
    let outerRadius: Int
    let distance: Int
    let amount: CGFloat
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        
        return a
    }
    
    func path(in rect: CGRect) -> Path {
        let divisor = gcd(innerRadius, outerRadius)
        
        let outerRadius = CGFloat(self.outerRadius)
        let innerRadius = CGFloat(self.innerRadius)
        let distance = CGFloat(self.distance)
        
        let difference = innerRadius - outerRadius
        let endpoint = ceil(2 * CGFloat.pi * outerRadius / CGFloat(divisor)) * amount
        
        var path = Path()
        
        stride(from: 0, through: endpoint, by: 0.01).forEach { theta in
            var x = difference * cos(theta) + distance * cos(difference / outerRadius * theta)
            var y = difference * sin(theta) - distance * sin(difference / outerRadius * theta)
            
            x += rect.width / 2
            y += rect.height / 2
            
            if theta == 0 {
                path.move(to: CGPoint(x: x, y: x))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        return path
    }
}
