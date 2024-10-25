//
//  ProfileViewModel.swift
//  Logify
//
//  Created by Vlad Klunduk on 02/10/2024.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var driver: Driver
    
    
    init(driver: Driver) {
        self.driver = driver
    }

    init() {
        self.driver = Driver(id: 1, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "Driver", status: "Available")
    }
}
