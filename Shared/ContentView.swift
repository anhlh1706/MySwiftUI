//
//  ContentView.swift
//  Shared
//
//  Created by Lê Hoàng Anh on 16/12/2020.
//

import SwiftUI
import Combine

class Order: ObservableObject {
    var objectWillChange = PassthroughSubject<Void, Never>()
    
    static let types = ["Vanilla", "Coconut", "Food", "Chicken"]
    
    var type = 0 { didSet { objectWillChange.send(()) } }
    
    var quantity = 0 { didSet { objectWillChange.send(()) } }
    
    var specialRequestsEnabled = false {
        didSet {
            if !specialRequestsEnabled {
                extraFrosting = false
                addSprinkles = false
            }
            objectWillChange.send(())
        }
    }
    
    var extraFrosting = false { didSet { objectWillChange.send(()) } }
    
    var addSprinkles = false { didSet { objectWillChange.send(()) } }
    
    var name = "" { didSet { objectWillChange.send(()) } }
    
    var streetAddress = "" { didSet { objectWillChange.send(()) } }
    
    var city = "" { didSet { objectWillChange.send(()) } }
    
    var zip = "" { didSet { objectWillChange.send(()) } }
    
    var isValid: Bool {
        [name, streetAddress, city, zip].first(where: { $0.isEmpty }) != nil
    }
}

struct ContentView: View {
    @ObservedObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $order.type, label: Text("Select something")) {
                        ForEach(0..<Order.types.count) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper(value: $order.quantity, in: (3...20)) {
                        Text("Quantity \(order.quantity)")
                    }
                }
                
                Section {
                    Toggle(isOn: $order.specialRequestsEnabled) {
                        Text("Special requests")
                    }
                    
                    if order.specialRequestsEnabled {
                        Toggle(isOn: $order.extraFrosting) {
                            Text("Add extra frosting")
                        }
                        
                        Toggle(isOn: $order.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }
                
                Section {
                    TextField("Name", text: $order.name)
                    
                    TextField("Street address", text: $order.streetAddress)
                    
                    TextField("City", text: $order.city)
                    
                    TextField("Zip", text: $order.zip)
                }
                
                Section {
                    Button {
                        self.placeOrder()
                    } label: {
                        Text("Order")
                    }
                    .disabled(order.isValid)

                }
                
                .navigationTitle(Text("Order"))
            }
        }
    }
    
    func placeOrder() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
