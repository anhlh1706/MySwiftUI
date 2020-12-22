//
//  ContentView.swift
//  Shared
//
//  Created by Lê Hoàng Anh on 16/12/2020.
//

import SwiftUI
import Combine

struct HomeView: View {
    
    @ObservedObject var product = Product()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack {
                        TextField("Product", text: $product.name)
                        Color(white: 0.8).frame(height: 1).padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                        TextField("Quantity", value: $product.quantity, formatter: NumberFormatter())
                        Color(white: 0.8).frame(height: 1).padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                        TextField("Price", value: $product.price, formatter: NumberFormatter())
                        Color(white: 0.8).frame(height: 1).padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: -25))
                    VStack(alignment: .leading, spacing: 105) {
                        Text("Select").foregroundColor(Color("red"))
                        Text("Add to cart").foregroundColor(Color("red"))
                    }.frame(width: 150)
                }.padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                Spacer()
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .navigationTitle(Text("My Shop"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

class Product: ObservableObject {
    var name: String = ""
    var price: Int = 0
    var quantity: Int = 0
}
