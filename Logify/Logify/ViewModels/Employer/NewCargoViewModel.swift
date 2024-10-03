//
//  NewCargoViewModel.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import Foundation
class NewCargoViewModel: ObservableObject {
    @Published var cargo: Cargo
    @Published var drivers: [Driver] = []
    @Published var cars: [Car] = []
    
    init() {
        self.cargo = Cargo(id: 0, description: "", status: "", creationDate: .now, employerId: 0, driverId: 0, carId: "")
        fetchDriversList()
        getCarsList()
    }
    
    func fetchDriversList() {
        drivers = [
            Driver(id: 1, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: ""),
            Driver(id: 2, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: ""),
            Driver(id: 3, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: ""),
            Driver(id: 4, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "")
        
        ]
    }
    
    func getCarsList()  {
        cars = [
            Car(plate: "PP6745C", brand: "Ford", model: "Focus", status: 0, isDeleted: 0, employerId: 1),
            Car(plate: "HD4236A", brand: "Toyota", model: "Prius", status: 0, isDeleted: 0, employerId: 1),
            Car(plate: "KI3597K", brand: "VW", model: "Golf", status: 0, isDeleted: 0, employerId: 1),
            Car(plate: "PO8972M", brand: "Renault", model: "Arkana", status: 0, isDeleted: 0, employerId: 1)
        ]
    }
}
