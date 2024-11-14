//
//  EmployerCargoCoordinatorView.swift
//  Logify
//
//  Created by Vlad Klunduk on 14/11/2024.
//

import SwiftUI

struct EmployerCargoCoordinatorView: View {
    @StateObject var coordinator = EmployerCargoCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(.list)
                .navigationDestination(for: CargoPage.self) { page in
                    coordinator.build(page)
                }
        }
    }
}

#Preview {
    EmployerCargoCoordinatorView()
}
