//
//  PointCreationViewModel.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/11/2024.
//

import Foundation

class PointCreationViewModel: ObservableObject {
    @Published var name = ""
    @Published var coordinates = ""
    var coordinator: CargoCreationCoordinator
    
    init(coordinator: CargoCreationCoordinator) {
        self.coordinator = coordinator
    }
    
    func validateCoordinates(_ coordinates: String) -> Bool {
        let array = coordinates.components(separatedBy: " ")
        if array.count == 2, let latitude = array.first,
            let longtitude = array.last {
            return true
        }
        return false
    }
    
    func showMap() {
        coordinator.push(.map(coordinates))
    }
    
    func hideMap() {
        coordinator.pop()
    }
}
