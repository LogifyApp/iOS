//
//  LogifyApp.swift
//  Logify
//
//  Created by Vlad Klunduk on 19/07/2024.
//

import SwiftUI

@main
struct LogifyApp: App {
    @StateObject private var userManager = UserManager()
    
    var body: some Scene {
        WindowGroup {
            AuthenticationView()
                .environmentObject(userManager)
        }
    }
}
