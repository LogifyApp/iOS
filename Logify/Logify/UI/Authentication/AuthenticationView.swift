//
//  SwiftUIView.swift
//  Logify
//
//  Created by Vlad Klunduk on 22/07/2024.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        NavigationStack {
            VStack {
                LogoLabel()
                    .padding(.top, 100)
                    .padding(.bottom, 140)
                VStack(spacing: 32) {
                    NavigationLink {
                        LoginView()
                    } label: {
                        Text("Sign in")
                            .modifier(
                                ButtonStyleModifier(
                                    width: 320,
                                    height: 38,
                                    background: .black,
                                    foreground: .white
                                )
                            )
                    }
                    NavigationLink {
                        RegistrationView()
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
        }
    }
}

#Preview {
    AuthenticationView()
}
