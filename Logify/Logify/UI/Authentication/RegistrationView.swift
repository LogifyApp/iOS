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
        VStack {
            Image("logo")
                .resizable()
                .frame(width: 200, height: 200)
                .padding(.top, 80)
                .padding(.bottom, 40)
            VStack(spacing: 32) {
                VStack(spacing: 16) {
                    CustomRolePicker(selection: $viewModel.role)
                    CustomTextField(
                        inputText: $viewModel.name, 
                        errorMessage: $viewModel.nameErrorMessage,
                        placeholder: "Name"
                    )
                    CustomTextField(
                        inputText: $viewModel.surname,
                        errorMessage: $viewModel.surnameErorMessage,
                        placeholder: "Surname"
                    )
                    CustomTextField(
                        inputText: $viewModel.phoneNumber,
                        errorMessage: $viewModel.phoneNumberErrorMessage,
                        placeholder: "Phone number"
                    )
                    CustomSecureField(
                        inputText: $viewModel.password,
                        errorMessage: $viewModel.passwordErrorMessage,
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
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .scaleEffect(1.3)
        }
        .onChange(of: viewModel.name) { oldValue, newValue in
            withAnimation {
                viewModel.nameErrorMessage = TextFieldValidator.shared.validateName(newValue)
            }
        }
        .onChange(of: viewModel.surname) { _, newValue in
            withAnimation {
                viewModel.surnameErorMessage = TextFieldValidator.shared.validateSurname(newValue)
            }
        }
        .onChange(of: viewModel.phoneNumber) { _, newValue in
            withAnimation {
                viewModel.phoneNumberErrorMessage = TextFieldValidator.shared.validatePhoneNumber(newValue)
            }
        }
        .onChange(of: viewModel.password) { _, newValue in
            withAnimation {
                viewModel.passwordErrorMessage = TextFieldValidator.shared.validatePassword(newValue)
            }
        }
    }
}

#Preview {
    RegistrationView()
}
