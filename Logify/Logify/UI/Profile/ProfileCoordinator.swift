//
//  ProfileCoordinator.swift
//  Logify
//
//  Created by Vlad Klunduk on 15/11/2024.
//

import SwiftUI

enum ProfilePage {
    case profile
}

class ProfileCoordinator: ObservableObject {
    @Published var path: NavigationPath
    
    init() {
        path = NavigationPath()
    }
    
    @ViewBuilder
    func build(_ page: ProfilePage) -> some View {
        switch page {
        case .profile:
            ProfileView(viewModel: ProfileViewModel(coordinator: self))
        }
    }
        
    func push(_ page: ProfilePage) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
}
