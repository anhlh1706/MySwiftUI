//
//  ContentView.swift
//  Shared
//
//  Created by Lê Hoàng Anh on 16/12/2020.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    
    let listString = "Everyone likes the weekend, it’s time to people do their work which they don’t have time to do in the weekdays."
        .components(separatedBy: " ")
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) var sizeClass
    #endif
    
    @EnvironmentObject var global: Global
    
    @State private var presentingModal = false
    
    @State private var showingExporter = false
    
    @State private var numbers = [1, 2, 3]
    
    @State private var screenTitle = "System Design"
    
    @State private var trueOrFalse = false
    
    @State private var someString = "Some string"
    
    @State private var someNumber = 1.0
    
    @State private var showAlert = false
    
    @State private var showActionSheet = false
    
    @State private var alertTitle = ""
    
    @State private var alertMsg = ""
    
    @State private var selectedDate = Date()
    
    // UserDefaults, @SceneStorage to save every scenes
    @AppStorage("selectedIndex") var selectedIndex = 2
    
    // Changes following device text scale factor automatically
    @ScaledMetric var textScale = 1
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text(Date(), formatter: formatter)
                    
                    #if os(iOS)
                    Text("Screen class: \(sizeClass == .regular ? "Regular" : "Compact")")
                    #endif
                    
                    Text("Device text scale: \(textScale, specifier: "%.2f")")
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
                    
                    // MARK: - Color picker
                    ColorPicker("Primary color", selection: $global.primaryColor)
                    
                    
                    // MARK: - Slider
                    Slider(value: $someNumber, in: 0...100) { _ in
                        withAnimation {
                            global.percent = Int(someNumber)
                        }
                    }
                    
                    // MARK: - ProgressView
                    ProgressView(value: Double(global.percent), total: 100)
                }
                
                Section {
                    // MARK: - DesignCode
                    NavigationLink("DesignCode", destination: DesignCodeView())
                }
                
                Section {
                    // MARK: - Spirograph
                    NavigationLink("Spirograph", destination: SpirographView())
                    
                    
                    // MARK: - Neumorphism
                    NavigationLink("Neumorphism", destination: NeumorphismExampleView())
                    
                    
                    // MARK: - MapKit
                    NavigationLink("MapKit", destination: MapKitView())
                    
                    
                    // MARK: - GameScene
                    NavigationLink("GameScene", destination: GameSceneView())
                    
                    
                    // MARK: - AVKit
                    NavigationLink("AVKit", destination: AVView())
                    
                    
                    // MARK: - Tabbar
                    NavigationLink("Tabbar", destination: TabbarView())
                    
                    
                    // MARK: - PageTabView
                    NavigationLink("PageTabView", destination: PageTabView())
                    
                    
                    // MARK: - GridView
                    NavigationLink("GridView", destination: GridView())
                    
                    
                    // MARK: - Github
                    NavigationLink("Github", destination: GithubView())
                    
                    
                    // MARK: - Picker
                    DisclosureGroup("Show picker") {
                        
                        Picker("Select something", selection: $selectedIndex) {
                            ForEach(listString, id: \.self) {
                                Text($0)
                            }
                        }
                        
                        DatePicker(formatter.string(from: selectedDate), selection: $selectedDate, displayedComponents: .date)
                        
                        DatePicker("Your date", selection: $selectedDate)
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .labelsHidden()
                    }
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
                        withAnimation {
                            numbers.append((numbers.last ?? 0) + 1)
                        }
                    }
                    .foregroundColor(global.primaryColor)
                }
                
                Section {
                    // MARK: - Present View
                    Button("Private things") {
                        let context = LAContext()
                        var error: NSError?
                        // MARK: - Biometrics
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
                    Button("Export file") {
                        showingExporter.toggle()
                    }
                }
                
                Section {
                    // MARK: - Link
                    Link("My profile", destination: URL(string: "https://facebook.com/anhbym")!)
                }
            }
            .navigationTitle(screenTitle)
            .alert(isPresented: $showAlert) { () -> Alert in
                Alert(title: Text(alertTitle), message: Text(alertMsg), dismissButton: .default(Text("OK")))
            }
            .actionSheet(isPresented: $showActionSheet, content: {
                ActionSheet(title: Text("This is the title"), message: Text("This is the message"), buttons: [
                    .default(Text("Close me")) {
                        print("Closed")
                    },
                    .default(Text("Close me also")) {
                        print("Closed 2nd")
                    },
                    .cancel()
                ])
            })
        }
        .statusBarHidden(trueOrFalse)
        .accentColor(global.primaryColor)
        .fileExporter(isPresented: $showingExporter, document: ImageDocument(image: UIImage(named: "banner")), contentType: .png) { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
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

