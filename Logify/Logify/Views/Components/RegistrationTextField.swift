//
//  RegistrationTextField.swift
//  Logify
//
//  Created by Vlad Klunduk on 21/07/2024.
//

import SwiftUI

struct RegistrationTextField: View {
    @State private var inputText = ""
    @Binding var savedText: String
    let placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $inputText)
            .padding()
            .frame(width: 320, height: 40)
            .background(.white)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(.gray, lineWidth: 0.4))
    }
}

#Preview {
    RegistrationTextField(savedText: .constant(""), placeholder: "name")
}
