//
//  EmployerDriversListViewModel.swift
//  Logify
//
//  Created by Vlad Klunduk on 11/10/2024.
//

import Foundation
class EmployerDriversListViewModel: ObservableObject {
    @Published var drivers: [Driver]
    
    init(drivers: [Driver]) {
        self.drivers = drivers
    }
    
    init() {
        drivers = [
            Driver(id: 1, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "Driver", status: "Available"),
            Driver(id: 2, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "", status: "Available"),
            Driver(id: 3, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "", status: "Available"),
            Driver(id: 4, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "", status: "Available")
        ]
    }
}
