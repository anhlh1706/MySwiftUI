//
//  MySwiftUIApp.swift
//  Shared
//
//  Created by Lê Hoàng Anh on 16/12/2020.
//

import SwiftUI

@main
struct MySwiftUIApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Global())
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .background:
                print("Background")
            case .inactive:
                print("Inactive")
            case .active:
                print("Active")
            @unknown default:
                print("Oh")
            }
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}
