//
//  TextFieldValidator.swift
//  Logify
//
//  Created by Vlad Klunduk on 24/10/2024.
//

import Foundation

class TextFieldValidator {
    
    static let shared = TextFieldValidator()
    private let phoneRegex = "^[0-9]{10,15}$"
    
    private init() {}
    
    func validatePhoneNumber(_ phoneNumber: String) -> String {
        if !NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: phoneNumber) {
            return "Incorrect phone number"
        } else {
            return ""
        }
    }
    
    func validatePassword(_ password: String) -> String {
        return ""
    }
}
