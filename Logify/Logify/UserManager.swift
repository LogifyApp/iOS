//
//  UserManager.swift
//  Logify
//
//  Created by Vlad Klunduk on 21/07/2024.
//

import Foundation

class UserManager: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }

    init() {
        self.user = User(id: 0, name: "", surname: "", phoneNumber: 0, password: "", role: "")
    }
}
