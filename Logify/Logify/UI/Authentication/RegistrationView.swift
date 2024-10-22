//
//  RegistrationView.swift
//  Logify
//
//  Created by Vlad Klunduk on 21/07/2024.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Image("logo")
                .resizable()
                .frame(width: 200, height: 200)
            VStack(spacing: 32) {
                VStack(spacing: 16) {
                    RolePicker(role: $viewModel.role)
                    CustomTextField(
                        savedText: $viewModel.name,
                        placeholder: "Name"
                    )
                    CustomTextField(
                        savedText: $viewModel.surname,
                        placeholder: "Surname"
                    )
                    CustomTextField(
                        savedText: $viewModel.phoneNumber,
                        placeholder: "Phone number"
                    )
                    CustomTextField(
                        savedText: $viewModel.password,
                        placeholder: "Password"
                    )
                }
                Button {
                    viewModel.register()
                } label: {
                    Text("Sign up")
                        .modifier(
                            ButtonStyleModifier(
                                width: 320,
                                height: 38,
                                background: .black,
                                foreground: .white
                            )
                        )
                    
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .scaleEffect(1.3)
        }
    }
}

#Preview {
    RegistrationView()
}
