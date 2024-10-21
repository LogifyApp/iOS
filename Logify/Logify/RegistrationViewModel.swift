//
//  RegistrationViewModel.swift
//  Logify
//
//  Created by Vlad Klunduk on 21/10/2024.
//

import Foundation
class RegistrationViewModel: ObservableObject {
    @Published var name = ""
    @Published var surname = ""
    @Published var phoneNumber = ""
    @Published var password = ""
    @Published var role = Role.driver
    
    func register() {
        
    }
}
