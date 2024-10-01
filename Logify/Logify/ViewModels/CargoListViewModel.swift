//
//  CargoViewModel.swift
//  Logify
//
//  Created by Vlad Klunduk on 01/10/2024.
//

import Foundation

class CargoListViewModel: ObservableObject {
    @Published var cargoList: [Cargo] = []
    var driver: Driver
    
    init(driver: Driver) {
        self.driver = driver
        fetchAllCargo()
    }
    
    func fetchAllCargo() {
        cargoList = [
            Cargo(id: 137287897,
                  description: "Cargo description",
                  status: "Created",
                  creationDate: Date.now,
                  carId: "24987",
                  points: [
                    Point(id: 0, label: "start", latitude: 52.219420, longtitude: 20.983114, order: 0),
                    Point(id: 1, label: "Point 1", latitude: 52.240238, longtitude: 21.018649, order: 0),
                    Point(id: 2, label: "Point 2", latitude: 52.260238, longtitude: 21.038649, order: 0),
                    Point(id: 3, label: "Point 3", latitude: 52.220238, longtitude: 20.95649, order: 0)
                ]),
            Cargo(id: 256365346,
                  description: "iaybdcuwybec",
                  status: "On verification",
                  creationDate: Date.now,
                  carId: "24987",
                  points: [
                    Point(id: 0, label: "start", latitude: 52.219420, longtitude: 20.983114, order: 0),
                    Point(id: 1, label: "Point 1", latitude: 52.220238, longtitude: 20.95649, order: 0)
                ]),
        ]
    }
}
