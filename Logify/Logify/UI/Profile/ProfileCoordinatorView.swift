//
//  ProfileCoordinatorView.swift
//  Logify
//
//  Created by Vlad Klunduk on 15/11/2024.
//

import SwiftUI

struct ProfileCoordinatorView: View {
    @StateObject var coordinator = ProfileCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(.profile)
                .navigationDestination(for: ProfilePage.self) { page in
                    coordinator.build(page)
                }
        }
    }
}

#Preview {
    ProfileCoordinatorView()
}
