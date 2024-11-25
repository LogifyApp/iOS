//
//  CargoCreationCoordinator.swift
//  Logify
//
//  Created by Vlad Klunduk on 15/11/2024.
//

import SwiftUI

enum CargoCreationPage {
    case main
    case car
    case driver
    case point
}

class CargoCreationCoordinator: ObservableObject {
    @Published var path: NavigationPath
    
    init() {
        self.path = NavigationPath()
    }
    
    @ViewBuilder
    func build(_ page: CargoCreationPage) -> some View {
        switch page {
        case .main:
            CargoCreationView(viewModel: CargoCreationViewModel(self))
        case .car:
            CarSelectionView()
        case .driver:
            DriverSelectionView()
        case .point:
            PointCreationView()
        }
    }
    
    func push(_ page: CargoCreationPage) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
}
