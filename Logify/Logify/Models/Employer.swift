//
//  Employer.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/09/2024.
//

import Foundation

class Employer: User {
    var id: Int
    var name: String
    var surname: String
    var phoneNumber: Int
    var password: String
    var role: String
    var drivers: [Driver]
    
    init(id: Int, name: String, surname: String, phoneNumber: Int, password: String, role: String, drivers: [Driver]) {
        self.id = id
        self.name = name
        self.surname = surname
        self.phoneNumber = phoneNumber
        self.password = password
        self.role = role
        self.drivers = drivers
    }
}
