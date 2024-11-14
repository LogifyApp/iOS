//
//  LoginViewModel.swift
//  Logify
//
//  Created by Vlad Klunduk on 22/10/2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var phoneNumber = ""
    @Published var password = ""
    
    @Published var phoneNumberErrorMessage = ""
    @Published var passwordErorMessage = ""
    
    func validate() {
        
    }
    
    func login() {
        
    }
}
