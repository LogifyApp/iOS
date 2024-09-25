//
//  UserManager.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import Foundation

class UserManager: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
