//
//  EmployerCargoCoordinator.swift
//  Logify
//
//  Created by Vlad Klunduk on 14/11/2024.
//

import SwiftUI

enum CargoPage: Hashable {
    case list
    case details(of: Cargo)
    case map(points: [Point])
}

class EmployerCargoCoordinator: ObservableObject {
    @Published var path: NavigationPath
    
    init() {
        path = NavigationPath()
    }
    
    @ViewBuilder
    func build(_ page: CargoPage) -> some View {
        switch page {
        case .list:
            EmployerCargoListView(
                viewModel: EmployerCargoListViewModel(coordinator: self),
                isTabViewPresented: .constant(true)
            )
        case .details(let cargo):
            EmployerCargoDetailsView(
                viewModel: EmployerCargoViewModel(coordinator: self),
                isTabViewPresented: .constant(true)
            )
        case .map(let points):
            MapView(viewModel: MapViewModel(points: points))
        }
        
    }
    
    func push(_ page: CargoPage) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
}
