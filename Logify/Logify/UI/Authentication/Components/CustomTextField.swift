//
//  RegistrationTextField.swift
//  Logify
//
//  Created by Vlad Klunduk on 21/07/2024.
//

import SwiftUI

struct CustomTextField: View {
    @State private var inputText = ""
    @Binding var savedText: String
    let placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $inputText)
            .padding()
            .frame(width: 320, height: 38)
            .background(.white)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(.gray, lineWidth: 0.4))
    }
}

#Preview {
    CustomTextField(savedText: .constant(""), placeholder: "name")
}
