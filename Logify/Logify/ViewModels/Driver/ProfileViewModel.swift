//
//  ProfileViewModel.swift
//  Logify
//
//  Created by Vlad Klunduk on 02/10/2024.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var driver: Driver
    @Published var employer: Employer?
    @Published var employersRequests: [Employer] = []
    
    init(driver: Driver) {
        self.driver = driver
    }

    init() {
        self.driver = Driver(id: 1, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "Driver", status: "Available")
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
}
