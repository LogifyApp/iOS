//
//  TextFieldValidator.swift
//  Logify
//
//  Created by Vlad Klunduk on 24/10/2024.
//

import Foundation

class TextFieldValidator {
    
    static let shared = TextFieldValidator()
    
    private init() {}
    
    func validatePhoneNumber(_ phoneNumber: String) -> String {
        if !NSPredicate(format: "SELF MATCHES %@", "^[0-9]{10,15}$").evaluate(with: phoneNumber) {
            return "Incorrect phone number"
        } else {
            return ""
        }
    }
    
    func validatePassword(_ password: String) -> String {
        if password.count < 8 {
            return "Password must contain at least 8 symbols"
        } else if password.count > 32 {
            return "Password must contain at most 32 symbols"
        }
        return ""
    }
    
    func validateName(_ name: String) -> String {
        if name.count < 2 {
            return "Name must contain at least 2 characters"
        } else if name.count > 40 {
            return "Name must contain at most 40 characters"
        }
        return ""
    }
    
    func validateSurname(_ surname: String) -> String {
        if surname.count < 2 {
            return "Surname must contain at least 2 characters"
        } else if surname.count > 60 {
            return "Surname must contain at most 60 characters"
        }
        return ""
    }
}
