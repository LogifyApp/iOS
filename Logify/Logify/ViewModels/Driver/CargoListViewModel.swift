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
    
    init() {
        driver = Driver(id: 1, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "", status: "Available")
        fetchAllCargo()
    }
    
    func fetchAllCargo() {
        cargoList = [
            Cargo(id: 137287897,
                  description: "Cargo description",
                  status: "Created",
                  creationDate: Date.now,
                  employerId: 0,
                  driverId: 1,
                  carId: "24987"
                  ),
            Cargo(id: 256365346,
                  description: "iaybdcuwybec",
                  status: "On verification",
                  creationDate: Date.now,
                  employerId: 0,
                  driverId: 1,
                  carId: "24987"
                  ),
        ]
    }
}
