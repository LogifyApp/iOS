//
//  DriverManager.swift
//  Logify
//
//  Created by Vlad Klunduk on 27/07/2024.
//

import Foundation

class DriverManager: ObservableObject {
    
    @Published var driver: Driver
    
    init(driver: Driver) {
        self.driver = driver
    }

    init() {
        self.driver = Driver(id: 1, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "")
    }
    
    func getActiveEmployer() -> Employer? {
        return Employer(id: 2, name: "Name2", surname: "Surname2", phoneNumber: 1234535345, password: "", role: "")
    }
    
    func getEmployersRequests() -> [Employer] {
        return [Employer(id: 2, name: "Name2", surname: "Name2", phoneNumber: 123, password: "", role: ""), Employer(id: 3, name: "Name2", surname: "Name2", phoneNumber: 123, password: "", role: ""), Employer(id: 4, name: "Name2", surname: "Name2", phoneNumber: 123, password: "", role: "")]
    }
    
    func acceptRequest(with employerId: Int) {
        
    }
    
    func declineRequest(with employerId: Int) {
        
    }
    
    func fetchAllCargo() -> [Cargo] {
        return [
            Cargo(id: 137287897,
                  description: "iaybdcuwybec",
                  status: "Created",
                  creationDate: Date.now,
                  carId: "24987",
                  points: [
                    Point(id: 0,
                          label: "kubsirv wjw r krju",
                          latitude: 238642,
                          longtitude: 2453534,
                          order: 1456343),
                    Point(id: 1,
                          label: "kubsirv wjw r krju",
                          latitude: 238642,
                          longtitude: 2453534,
                          order: 1456343)
                  ]),
            Cargo(id: 256365346,
                  description: "iaybdcuwybec",
                  status: "Created",
                  creationDate: Date.now,
                  carId: "24987",
                  points: [
                    Point(id: 0,
                          label: "kubsirv wjw r krju",
                          latitude: 238642,
                          longtitude: 2453534,
                          order: 1456343),
                    Point(id: 1,
                          label: "kubsirv wjw r krju",
                          latitude: 238642,
                          longtitude: 2453534,
                          order: 1456343)
                  ])
        ]
    }    
}
