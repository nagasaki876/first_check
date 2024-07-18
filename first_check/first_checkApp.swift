//
//  first_checkApp.swift
//  first_check
//
//  Created by Raheem Campbell on 7/7/24.
//

import SwiftUI
import SwiftData
import FirebaseCore
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct first_checkApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @Environment(\.modelContext) private var modelContext
  
    
    var body: some Scene {
        WindowGroup {
            Home()
                .modelContainer(for: [Item.self])
        }
    }
}
