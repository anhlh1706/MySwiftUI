//
//  ContentView.swift
//  Shared
//
//  Created by Lê Hoàng Anh on 16/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            GradientView(colors: [isNight ? .black : .blue, Color("lightBlue")],
                         startPoint: .topLeading,
                         endPoint: .bottomTrailing)
            .ignoresSafeArea(edges: .all)
            
            VStack {
                Text("Cupertino, CA")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.white)
                    .frame(width: 300, height: 100)
                
                WeatherSituationView(imageName: isNight ? "moon.stars.fill" : "sun.max.fill", degree: 33)
                
                Spacer()
                
                HStack(spacing: 20) {
                    WeatherInfo(dayOfWeek: "Mon", situation: .one, degree: 23)
                    
                    WeatherInfo(dayOfWeek: "Tue", situation: .two, degree: 15)
                    
                    WeatherInfo(dayOfWeek: "Wed", situation: .three, degree: 28)

                    WeatherInfo(dayOfWeek: "Thu", situation: .four, degree: 33)
                    
                    WeatherInfo(dayOfWeek: "Fri", situation: .five, degree: 31)
                }
                
                Spacer()
                
                RoundedButton(title: "Change time of day", color: isNight ? .black : .blue) {
                    isNight.toggle()
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - WeatherInfoView
struct WeatherInfo: View {
    
    enum SituationType: String {
        case one = "cloud.fill"
        case two = "snow"
        case three = "sunset.fill"
        case four = "sun.max.fill"
        case five = "cloud.sun.fill"
    }
    
    var dayOfWeek: String
    var situation: SituationType
    var degree: Int
    
    var body: some View {
        VStack {
            Text("\(dayOfWeek)")
                .foregroundColor(.white)
                .font(.system(size: 22))
            Image(systemName: situation.rawValue)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(degree)")
                .foregroundColor(.white)
                .font(.system(size: 25, weight: .medium))
        }
    }
}

// MARK: - GradientView
struct GradientView: View {
    
    var colors: [Color]
    var startPoint: UnitPoint
    var endPoint: UnitPoint
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: startPoint, endPoint: endPoint)
    }
}

// MARK: - WeatherSituationView
struct WeatherSituationView: View {
    
    var imageName: String
    var degree: Int
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 150)
            Text("\(degree)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
