//
//  CargoManager.swift
//  Logify
//
//  Created by Vlad Klunduk on 27/09/2024.
//

import Foundation

class CargoManager: ObservableObject {
    
    @Published var selectedCargo: Cargo
    
    init() {
        selectedCargo = Cargo(id: 137287897,
                              description: "Descriptioin",
                              status: "Created",
                              creationDate: Date.now,
                              carId: "24987",
                              points: [
                                 Point(id: 0, label: "start", latitude: 52.219420, longtitude: 20.983114, order: 0),
                                 Point(id: 1, label: "mokotow", latitude: 52.240238, longtitude: 21.018649, order: 0),
                                 Point(id: 2, label: "wola", latitude: 52.260238, longtitude: 21.038649, order: 0),
                                 Point(id: 3, label: "bemovo", latitude: 52.220238, longtitude: 20.95649, order: 0)
                              ])
    }
    
    init(_ cargo: Cargo) {
        selectedCargo = cargo
    }
}
