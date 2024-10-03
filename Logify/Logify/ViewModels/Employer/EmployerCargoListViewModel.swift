//
//  EmployerCargoListViewModel.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import Foundation
class EmployerCargoListViewModel: ObservableObject {
    @Published var cargoList: [Cargo] = []
    var employer: Employer
    
    init(employer: Employer) {
        self.employer = employer
        fetchAllCargo()
    }
    
    init() {
        self.employer = Employer(id: 2, name: "Name", surname: "Surname", phoneNumber: 1234535345, password: "", role: "")
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
