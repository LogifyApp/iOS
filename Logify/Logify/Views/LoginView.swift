//
//  LoginView.swift
//  Logify
//
//  Created by Vlad Klunduk on 22/07/2024.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .scaleEffect(1.15)
            VStack(spacing: 80) {
                LogoLabel()
                VStack(spacing: 20) {
                    RegistrationTextField(
                        savedText: .constant(""),
                        placeholder: "Phone number"
                    )
                    RegistrationTextField(
                        savedText: .constant(""),
                        placeholder: "Password"
                    )
                    Button(action: {}) {
                        NavigationText(
                            text: "Sign in",
                            foreground: .white,
                            backround: .black,
                            width: 320,
                            height: 40
                        )
                    }
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
