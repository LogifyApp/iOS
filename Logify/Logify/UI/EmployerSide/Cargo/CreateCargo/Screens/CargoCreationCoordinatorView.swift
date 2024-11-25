//
//  CargoCreationCoordinatorView.swift
//  Logify
//
//  Created by Vlad Klunduk on 15/11/2024.
//

import SwiftUI

struct CargoCreationCoordinatorView: View {
    @StateObject private var coordinator = CargoCreationCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(.main)
                .navigationDestination(for: CargoCreationPage.self) { page in
                    coordinator.build(page)
                }
        }
        .environmentObject(CargoCreationViewModel(coordinator))
    }
}

#Preview {
    CargoCreationCoordinatorView()
}
