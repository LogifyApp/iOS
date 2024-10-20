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
                    CustomTextField(
                        savedText: .constant(""),
                        placeholder: "Phone number"
                    )
                    CustomTextField(
                        savedText: .constant(""),
                        placeholder: "Password"
                    )
                    Button(action: {}) {
                        Button(action: {}) {
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
            }
        }
    }
}

#Preview {
    LoginView()
}
