//
//  User.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import Foundation

protocol User {
    var id: Int { get set }
    var name: String { get set }
    var surname: String { get set }
    var phoneNumber: Int { get set }
    var password: String { get set }
    var role: String { get set }
}

extension User {
    func getFullName() -> String {
        return name + " " + surname
    }
}
