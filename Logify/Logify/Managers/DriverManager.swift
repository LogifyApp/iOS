//
//  DriverManager.swift
//  Logify
//
//  Created by Vlad Klunduk on 27/07/2024.
//

import Foundation

class DriverManager: ObservableObject {
    
    @Published var driver: Driver
    @Published var employersRequests: [Employer] = []
    
    init(driver: Driver) {
        self.driver = driver
    }

    init() {
        self.driver = Driver(id: 1, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "")
        getEmployersRequests()
    }
    
    func getActiveEmployer() -> Employer? {
        return Employer(id: 2, name: "Name", surname: "Surname", phoneNumber: 1234535345, password: "", role: "")
    }
    
    func getEmployersRequests() {
        employersRequests = [Employer(id: 2, name: "Name", surname: "Surname", phoneNumber: 123, password: "", role: ""), Employer(id: 3, name: "Name", surname: "Surname", phoneNumber: 123, password: "", role: ""), Employer(id: 4, name: "Name", surname: "Surname", phoneNumber: 123, password: "", role: "")]
    }
    
    func acceptRequest(with employerId: Int) {
        
    }
    
    func declineRequest(with employerId: Int) {
        
    }
    
    func fetchAllCargo() -> [Cargo] {
        return [
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
