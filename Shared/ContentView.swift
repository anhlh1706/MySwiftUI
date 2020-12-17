//
//  ContentView.swift
//  Shared
//
//  Created by Lê Hoàng Anh on 16/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    static var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    static var listString = "Everyone likes the weekend, it’s time to people do their work which they don’t have time to do in the weekdays. That’s cleaning house, shopping or simply spent time with family"
        .components(separatedBy: " ")
    
    @State var screenTitle = "System Design"
    
    @State var selectedIndex = 2
    
    @State var trueOrFalse = false
    
    @State var someString = "Some string"
    
    @State var someNumber = 0.0
    
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
                    Stepper("It's \(Int(someNumber))", value: $someNumber, in: 0...20)
                    
                    
                    // MARK: - Slider
                    Slider(value: $someNumber, in: 0...20)
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
                    NavigationLink("Tabbar", destination: TabbarView())
                }
                
                // MARK: - List
                let people = (1...6).map { Person(name: "Person \($0)") }
                
                ForEach(people) {
                    Text($0.name)
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Person: Identifiable {
    var id = UUID()
    var name: String
}


