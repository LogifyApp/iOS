//
//  LoginView.swift
//  Logify
//
//  Created by Vlad Klunduk on 22/07/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            LogoLabel()
                .padding(.top, 80)
                .padding(.bottom, 100)
            VStack(spacing: 32) {
                VStack(spacing: 16) {
                    CustomTextField(
                        inputText: $viewModel.phoneNumber, 
                        errorMessage: $viewModel.phoneNumberErrorMessage,
                        placeholder: "Phone number"
                    )
                    CustomSecureField(
                        inputText: $viewModel.password,
                        errorMessage: $viewModel.passwordErorMessage,
                        placeholder: "Password"
                    )
                }
                Button {
                    viewModel.login()
                } label: {
                    Text("Sign in")
                        .modifier(ButtonStyleModifier(
                            width: 320,
                            height: 38,
                            background: .black,
                            foreground: .white
                        ))
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
        .onChange(of: viewModel.phoneNumber) { _, newValue in
            withAnimation {
                viewModel.phoneNumberErrorMessage = TextFieldValidator.shared.validatePhoneNumber(newValue)
            }
        }
    }
}

#Preview {
    LoginView()
}
