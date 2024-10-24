//
//  CustomSecureField.swift
//  Logify
//
//  Created by Vlad Klunduk on 24/10/2024.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var inputText: String
    @Binding var errorMessage: String
    @State private var isSecured = true
    let placeholder: String
    
    var body: some View {
        VStack {
            HStack {
                if isSecured {
                    SecureField(placeholder, text: $inputText)
                        .textContentType(.password)
                        .textInputAutocapitalization(.never)
                        .padding()
                    Button("", systemImage: "eye.slash.fill") {
                        isSecured.toggle()
                    }
                    .buttonStyle(PlainButtonStyle())
                } else {
                    TextField(placeholder, text: $inputText)
                        .textContentType(.password)
                        .textInputAutocapitalization(.never)
                        .padding()
                    Button("", systemImage: "eye.fill") {
                        isSecured.toggle()
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
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
    CustomSecureField(
        inputText: .constant(""),
        errorMessage: .constant(""),
        placeholder: "Password"
    )
}
