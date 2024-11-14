//
//  EmployerCargoViewModel.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import Foundation
class EmployerCargoViewModel: ObservableObject {
    @Published var cargo: Cargo
    @Published var points: [Point] = []
    @Published var documents: Set<URL> = [URL(filePath: "sdf")]
    var coordinator: EmployerCargoCoordinator!
    
    init(coordinator: EmployerCargoCoordinator) {
        self.coordinator = coordinator
        cargo = Cargo(
            id: 137287897,
            description: "Descriptioin",
            status: "Created",
            creationDate: Date.now,
            employerId: 0,
            driverId: 1,
            carId: "24987"
        )
        getPoints()
    }
    
    init(_ cargo: Cargo) {
        self.cargo = cargo
        getPoints()
    }
    
    func getPoints() {
        points = [
            Point(id: 0, label: "start", latitude: 52.219420, longtitude: 20.983114, order: 0, cargoId: 1),
            Point(id: 1, label: "Point 1", latitude: 52.240238, longtitude: 21.018649, order: 0, cargoId: 1),
            Point(id: 2, label: "Point 2", latitude: 52.260238, longtitude: 21.038649, order: 0, cargoId: 1),
            Point(id: 3, label: "Point 3", latitude: 52.220238, longtitude: 20.95649, order: 0, cargoId: 1)
         ]
    }
    
    func showMap() {
        coordinator.push(.map(points: points))
    }
    
    func showDocuments() {
        coordinator.push(.documents(cargoId: cargo.id))
    }
}
