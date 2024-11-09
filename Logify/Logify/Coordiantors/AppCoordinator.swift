//
//  AppCoordinator.swift
//  Logify
//
//  Created by Vlad Klunduk on 09/11/2024.
//

import Combine
import SwiftUI

final class AppCoordinator: ObservableObject {
    @Published var path: NavigationPath
    
    init(path: NavigationPath) {
        self.path = path
    }
    
    @ViewBuilder
    func build(_ page: Page) -> some View {
        switch page {
        case .authentication: AuthenticationView()
        case .login: LoginView()
        case .registration: RegistrationView()
        }
    }
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
}


enum Page {
    case authentication, login, registration
}
