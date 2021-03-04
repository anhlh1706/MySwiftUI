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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Global())
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Launched")
        return true
    }
}
