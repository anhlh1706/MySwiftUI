//
//  Neumorphism.swift
//  MySwiftUI
//
//  Created by Lê Hoàng Anh on 19/02/2021.
//

import SwiftUI

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
    static let lightStart = Color(red: 60 / 255, green: 160 / 255, blue: 240 / 255)
    static let lightEnd = Color(red: 30 / 255, green: 80 / 255, blue: 120 / 255)
}

// MARK: - Button Style
struct SimpleButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(Color.offWhite)
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                    .mask(Circle().fill(LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .topLeading, endPoint: .bottomTrailing)))
                            )
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 8)
                                    .blur(radius: 4)
                                    .offset(x: -2, y: -2)
                                    .mask(Circle().fill(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)))
                            )
                    } else {
                        Circle()
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                }
            )
    }
}

struct DarkButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .background(
                DarkBackground(isHighlighted: configuration.isPressed, shape: Circle())
            )
            .animation(nil)
    }
}

struct ColorfulButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .background(
                ColorfulBackground(isHighlighted: configuration.isPressed, shape: Circle())
            )
            .animation(nil)
    }
}

struct ColorfulBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        if isHighlighted {
            shape
                .fill(LinearGradient(gradient: Gradient(colors: [.lightEnd, .lightStart]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .overlay(shape.stroke(LinearGradient(gradient: Gradient(colors: [.lightStart, .lightEnd]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 4))
                .shadow(color: .lightStart, radius: 10, x: 5, y: 5)
                .shadow(color: .lightEnd, radius: 10, x: -5, y: -5)
        } else {
            shape
                .fill(LinearGradient(gradient: Gradient(colors: [.lightStart, .lightEnd]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .overlay(shape.stroke(LinearGradient(gradient: Gradient(colors: [.lightEnd, .lightStart]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 4))
                .shadow(color: .lightStart, radius: 10, x: -10, y: -10)
                .shadow(color: .lightEnd, radius: 10, x: 10, y: 10)
        }
    }
}


// MARK: - Background
struct DarkBackground<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S
    
    var body: some View {
        if isHighlighted {
            shape
                .fill(LinearGradient(gradient: Gradient(colors: [.darkEnd, .darkStart]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .overlay(shape.stroke(LinearGradient(gradient: Gradient(colors: [.darkStart, .darkEnd]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 4))
                .shadow(color: .darkStart, radius: 10, x: 5, y: 5)
                .shadow(color: .darkEnd, radius: 10, x: -5, y: -5)
        } else {
            shape
                .fill(LinearGradient(gradient: Gradient(colors: [.darkStart, .darkEnd]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .overlay(shape.stroke(LinearGradient(gradient: Gradient(colors: [.darkEnd, .darkStart]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 4))
                .shadow(color: .darkStart, radius: 10, x: -10, y: -10)
                .shadow(color: .darkEnd, radius: 10, x: 10, y: 10)
        }
    }
}


// MARK: - Toggle Style
struct DarkToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            configuration.label
                .padding(30)
                .contentShape(Circle())
        }
        .background(
            DarkBackground(isHighlighted: configuration.isOn, shape: Circle()))
    }
}

struct ColorfulToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            configuration.label
                .padding(30)
                .contentShape(Circle())
        }
        .background(
            ColorfulBackground(isHighlighted: configuration.isOn, shape: Circle()))
    }
}

// MARK: - Main View
struct NeumorphismExampleView: View {
    
    @State private var isToggled = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.darkStart, .darkEnd]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            HStack(spacing: 40) {
                VStack(spacing: 40) {
                    Button(action: {
                        print("Tap")
                    }, label: {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.white)
                    })
                    .buttonStyle(DarkButtonStyle())
                    
                    Toggle(isOn: $isToggled) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.white)
                    }
                    .toggleStyle(DarkToggleStyle())
                }
                
                VStack(spacing: 40) {
                    Button(action: {
                        print("Tap")
                    }, label: {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.white)
                    })
                    .buttonStyle(ColorfulButtonStyle())
                    
                    Toggle(isOn: $isToggled) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.white)
                    }
                    .toggleStyle(ColorfulToggleStyle())
                }
            
            }
        }
        .ignoresSafeArea(.all)
    }
    
}
