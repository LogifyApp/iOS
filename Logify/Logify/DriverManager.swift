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
        self.driver = Driver(id: 1, name: "Name", surname: "Surname", phoneNumber: 1, password: "", role: "", employer: Employer(id: 2, name: "Name2", surname: "Name2", phoneNumber: 123, password: "", role: "", drivers: []))
    }
    
    func getActiveEmployer() -> Employer? {
        print("returned active employer")
        return Employer(id: 2, name: "Name2", surname: "Name2", phoneNumber: 123, password: "", role: "", drivers: [])
    }
    
    func getEmployersRequests() -> [Employer] {
        return []
    }
    
    func removeEmployer() {
        print("employer removed")
    }
}
