//
//  ContentView.swift
//  Shared
//
//  Created by Lê Hoàng Anh on 16/12/2020.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    
    static var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    static var listString = "Everyone likes the weekend, it’s time to people do their work which they don’t have time to do in the weekdays. That’s cleaning house, shopping or simply spent time with family"
        .components(separatedBy: " ")
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var sizeClass
    #endif
    
    @EnvironmentObject var global: Global
    
    @State private var presentingModal = false
    
    @State private var numbers = [1, 2, 3]
    
    @State private var screenTitle = "System Design"
    
    @State private var selectedIndex = 2
    
    @State private var trueOrFalse = false
    
    @State private var someString = "Some string"
    
    @State private var someNumber = 1.0
    
    @State private var selectedDate = Date()
    
    @State private var showAlert = false
    
    @State private var alertTitle = ""
    
    @State private var alertMsg = ""
    
    @State private var selectedItem = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    // MARK: - Text
                    Text("\(Date(), formatter: Self.formatter)")
                    #if os(iOS)
                    Text("Screen class: \(sizeClass == .regular ? "Regular" : "Compact")")
                    #endif
                }
                
                Section {
                    // MARK: - Switch
                    Toggle(isOn: $trueOrFalse, label: {
                        Text("Editting title \(trueOrFalse ? "enabled" : "disabled")")
                    })
                    
                    // MARK: - TextField
                    TextField("Screen title", text: $screenTitle)
                        .disabled(!trueOrFalse)
                        .opacity(trueOrFalse ? 1 : 0.6)
                    
                    // MARK: - Stepper
                    Stepper("It's \(Int(global.percent)) percent", value: $global.percent, in: 1...100)
                    
                    Slider(value: $someNumber, in: 0...100) { _ in
                        global.percent = Int(someNumber)
                    }
                    
                    #if os(iOS)
                    global.primaryColor
                        .frame(width: (UIScreen.main.bounds.width - 80) / 100 * CGFloat(global.percent), height: 2)
                        .cornerRadius(1)
                        .animation(.default)
                    #endif
                    
                    // MARK: - Color picker
                    ColorPicker("Primary color", selection: $global.primaryColor)
                }
                
                Section {
                    // MARK: - Date Picker
                    DatePicker(Self.formatter.string(from: selectedDate), selection: $selectedDate, displayedComponents: .date)
                    
                    // MARK: - Picker
                    Picker("Select something", selection: $selectedIndex) {
                        ForEach(0..<Self.listString.count) {
                            Text(Self.listString[$0])
                        }
                    }
                }
                
                Section {
                    // MARK: - NavigationLink
                    NavigationLink("Tabbar", destination: TabbarView())
                }
                
                // MARK: - List
                Section {
                    List {
                        ForEach(numbers, id: \.self) { num in
                            Text("\(num)")
                                .contextMenu {
                                    Button("Delete") {
                                        if let index = numbers.firstIndex(of: num) {
                                            withAnimation {
                                                removeNumber(index: IndexSet(integer: index))
                                            }
                                        }
                                    }
                                }
                        }
                        .onDelete(perform: removeNumber)
                    }
                    Button("Add number") {
                        numbers.append((numbers.last ?? 0) + 1)
                    }
                    .foregroundColor(global.primaryColor)
                }
                
                Section {
                    NavigationLink("RoundedButton", destination: RoundedButton(title: "Action", action: {}))
                    // MARK: - Present View
                    Button("Private things") {
                        let context = LAContext()
                        var error: NSError?
                        
                        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                            let reason = "Need to unlock your data!"
                            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { (success, error) in
                                if success {
                                    presentingModal = true
                                }
                            }
                        }
                    }.sheet(isPresented: $presentingModal) {
                        PresentedView()
                    }
                    .foregroundColor(global.primaryColor)
                }
                
                Section {
                    // MARK: - Spirograph
                    NavigationLink("Spirograph", destination: SpirographView())
                    
                    
                    // MARK: - Neumorphism
                    NavigationLink("Neumorphism", destination: NeumorphismExampleView())
                    
                    
                    // MARK: - MapKit
                    NavigationLink("MapKit", destination: MapKitView())
                }
            }
            .navigationTitle(screenTitle)
            .alert(isPresented: $showAlert) { () -> Alert in
                Alert(title: Text(alertTitle), message: Text(alertMsg), dismissButton: .default(Text("OK")))
            }
        }
        .accentColor(global.primaryColor)
        .environmentObject(global)
    }
    
    func showAlert(title: String, msg: String = "") {
        alertTitle = title
        alertMsg = msg
        showAlert = true
    }
    
    func removeNumber(index: IndexSet) {
        numbers.remove(atOffsets: index)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Person: Identifiable {
    var id: Int
    var name: String
}

