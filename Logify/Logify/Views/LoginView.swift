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
        VStack(spacing: 80) {
            LogoLabel()
            VStack(spacing: 20) {
                CustomTextField(
                    savedText: $viewModel.phoneNumber,
                    placeholder: "Phone number"
                )
                CustomTextField(
                    savedText: $viewModel.password,
                    placeholder: "Password"
                )
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
    LoginView()
}
