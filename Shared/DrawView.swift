//
//  DrawView.swift
//  MySwiftUI
//
//  Created by Lê Hoàng Anh on 01/02/2021.
//

import SwiftUI

struct DrawView: View {
    
    @EnvironmentObject var global: Global
    
    @State private var petalOffset: Double = -20
    
    @State private var petalWidth: Double = 40
    
    @State private var colorCycle = 0.0
    
    @State private var insertAmount: CGFloat = 50
    
    @State private var currentOffset: CGFloat = 0
    
    var body: some View {
        ScrollView {
            VStack {
                Triangle()
                    .stroke(Color.red, style: StrokeStyle(lineWidth: 18, lineCap: .round, lineJoin: .round))
                    .frame(width: 220, height: 220)
                
                Color(UIColor.clear).frame(height: 70)
                
                Arc(percent: Double(global.percent), clockwise: false)
                    .stroke(Color.blue, style: StrokeStyle(lineWidth: 18, lineCap: .round, lineJoin: .round))
                    .frame(width: 220, height: 220)
                
                Color(.clear).frame(height: 70)
                
                Path { path in
                    path.move(to: CGPoint(x: 110, y: 0))
                    path.addLine(to: CGPoint(x: 220, y: 220))
                    path.addLine(to: CGPoint(x: 0, y: 220))
                    path.addLine(to: CGPoint(x: 110, y: 0))
                }
                .fill(Color.blue)
                .frame(width: 220, height: 220)
                
                Color(UIColor.clear).frame(height: 70)
            }
            
            VStack {
                
                HStack(spacing: 55) {
                    Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                        .stroke(Color.red, lineWidth: 1)
                        .frame(width: 140, height: 140)
                    
                    Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                        .fill(Color.red, style: FillStyle(eoFill: true))
                        .frame(width: 140, height: 140)
                }
                
                Color(UIColor.clear).frame(height: 20)
                
                Text("Offset")
                Slider(value: $petalOffset, in: -20...20)
                    .padding([.horizontal, .bottom])
                
                Text("Width")
                Slider(value: $petalWidth, in: 0...40)
                    .padding([.horizontal, .bottom])
            }
            
            VStack {
                ColorCyclingCircle(amount: colorCycle)
                    .gesture(
                        DragGesture()
                            .onChanged {
                                currentOffset = $0.location.x - $0.startLocation.x + CGFloat(colorCycle)
                                colorCycle = Double(currentOffset)
                            }
                            .onEnded { _ in currentOffset = 0 }
                    )
                    .frame(width: 250, height: 250)
                
                ColorView()
                    .padding(.top)
                
                Trapezoid(insertAmount: insertAmount)
                    .gesture(
                        DragGesture()
                            .onChanged {
                                currentOffset = $0.location.x - $0.startLocation.x + insertAmount
                                insertAmount = currentOffset
                            }
                            .onEnded { _ in currentOffset = 0 }
                    )
                    .frame(width: 250, height: 250)
                
            }
        }
    }
}

// MARK: - Triangle
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minY, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
    
}

// MARK: - Arc
struct Arc: Shape {
    
    var startAngle: Angle
    
    var endAngle: Angle
    
    var clockwise: Bool
    
    init(percent: Double, clockwise: Bool = false, modifiedDegrees: Double = -90) {
        startAngle = .degrees(modifiedDegrees)
        endAngle = .degrees((percent / 100) * 360 + modifiedDegrees)
        self.clockwise = clockwise
    }
    
    init(startAngle: Angle, endAngle: Angle, clockwise: Bool = false) {
        self.startAngle = startAngle
        self.endAngle = endAngle
        self.clockwise = clockwise
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        
        return path
    }
}

// MARK: - Flower
struct Flower: Shape {
    
    var petalOffset: Double
    var petalWidth: Double
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 8).forEach { num in
            let rotation = CGAffineTransform(rotationAngle: num)
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            
            let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y: 0, width: CGFloat(petalWidth), height: CGFloat(rect.width / 2)))
            
            let rotatedPetal = originalPetal.applying(position)
            
            path.addPath(rotatedPetal)
        }
        
        return path
    }
}

// MARK: - ColorCyclingCircle
struct ColorCyclingCircle: View {
    
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: CGFloat(value))
                    .stroke(color(for: value, brightness: 1), lineWidth: 2)
            }
        }
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
    
}

struct ColorView: View {
    @State private var amount: CGFloat = 0.8
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(red: 1, green: 0, blue: 0))
                .frame(width: 170 * amount)
                .offset(x: -46, y: -40)
                .blendMode(.screen)
            
            Circle()
                .fill(Color(red: 0, green: 1, blue: 0))
                .frame(width: 170 * amount)
                .offset(x: 46, y: -40)
                .blendMode(.screen)
            
            Circle()
                .fill(Color(red: 0, green: 0, blue: 1))
                .frame(width: 170 * amount)
                .offset(y: 40)
                .blendMode(.screen)
        }
        .frame(width: 250, height: 250)
        
        Slider(value: $amount).padding([.horizontal, .bottom])
    }
}

// MARK: - Trapezoid
struct Trapezoid: Shape {
    var insertAmount: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insertAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insertAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}
