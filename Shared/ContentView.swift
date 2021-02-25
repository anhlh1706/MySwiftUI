//
//  ContentView.swift
//  Shared
//
//  Created by Lê Hoàng Anh on 16/12/2020.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    
    @Environment(\.horizontalSizeClass) var sizeClass
    
    @State var presentingModal = false
    
    static var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    static var listString = "Everyone likes the weekend, it’s time to people do their work which they don’t have time to do in the weekdays. That’s cleaning house, shopping or simply spent time with family"
        .components(separatedBy: " ")
    
    @State var numbers = [1, 2, 3]
    
    @State var screenTitle = "System Design"
    
    @State var selectedIndex = 2
    
    @State var trueOrFalse = false
    
    @State var someString = "Some string"
    
    @State var someNumber = 1.0
    
    @State var selectedDate = Date()
    
    @State var showAlert = false
    
    @State var alertTitle = ""
    
    @State var alertMsg = ""
    
    @State var selectedItem = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    // MARK: - Text
                    Text("\(Date(), formatter: Self.formatter)")
                    
                    Text("Screen class: \(sizeClass == .regular ? "Regular" : "Compact")")
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
                    Stepper("It's \(Int(someNumber))", value: $someNumber, in: 1...20)
                    
                    
                    // MARK: - Slider
                    Slider(value: $someNumber, in: 1...20)
                    
                    Color(.blue)
                        .frame(width: 13*CGFloat(someNumber), height: 2)
                        .cornerRadius(1)
                        .animation(.default)
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
                let people = (1...3).map { Person(id: $0, name: "Person \($0)") }
                
                ForEach(people) {
                    Text($0.name)
                }
                
                Section {
                    List {
                        ForEach(numbers, id: \.self) {
                            Text("\($0)")
                        }
                        .onDelete(perform: removeNumber)
                    }
                    Button("Add number") {
                        numbers.append((numbers.last ?? 0) + 1)
                    }
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
                }
                
                Section {
                    NavigationLink("Spirograph", destination: SpirographView())
                    
                    NavigationLink("Neumorphism", destination: NeumorphismExampleView())
                }
            }
            .navigationTitle(screenTitle)
            .alert(isPresented: $showAlert) { () -> Alert in
                Alert(title: Text(alertTitle), message: Text(alertMsg), dismissButton: .default(Text("OK")))
            }
        }
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

