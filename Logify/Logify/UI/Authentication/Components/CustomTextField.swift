//
//  RegistrationTextField.swift
//  Logify
//
//  Created by Vlad Klunduk on 21/07/2024.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var inputText: String
    @Binding var errorMessage: String
    let placeholder: String
    
    var body: some View {
        VStack {
            TextField(placeholder, text: $inputText)
                .padding()
                .frame(width: 320, height: 38)
                .background(.white)
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .stroke(
                            errorMessage.isEmpty ? .gray : .red,
                            lineWidth: errorMessage.isEmpty ? 0.4 : 1
                        )
                )
                .textInputAutocapitalization(.never)
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .frame(width: 280, alignment: .leading)
                    .foregroundStyle(.red)
                    .font(.footnote)
            }
        }
    }
}

#Preview {
    CustomTextField(
        inputText: .constant(""),
        errorMessage: .constant("Error incorrect email"),
        placeholder: "name"
    )
}
