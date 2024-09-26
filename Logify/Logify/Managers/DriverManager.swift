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
    
    func getActiveChatId() -> Int {
        return 0
    }
    
    func getChatMessages() -> [Message] {
        return []
    }
}
