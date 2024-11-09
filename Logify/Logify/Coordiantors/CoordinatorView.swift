//
//  CoordinatorView.swift
//  Logify
//
//  Created by Vlad Klunduk on 09/11/2024.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject private var coordinator = AppCoordinator(path: NavigationPath())
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(.authentication)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page)
                }
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    CoordinatorView()
}
