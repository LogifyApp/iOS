//
//  Driver.swift
//  Logify
//
//  Created by Vlad Klunduk on 27/07/2024.
//

import Foundation

class Driver: User {
    var id: Int
    var name: String
    var surname: String
    var phoneNumber: Int
    var password: String
    var role: String
    
    init(id: Int, name: String, surname: String, phoneNumber: Int, password: String, role: String) {
        self.id = id
        self.name = name
        self.surname = surname
        self.phoneNumber = phoneNumber
        self.password = password
        self.role = role
    }
}
