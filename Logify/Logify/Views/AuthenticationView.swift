//
//  SwiftUIView.swift
//  Logify
//
//  Created by Vlad Klunduk on 22/07/2024.
//

import SwiftUI

struct AuthenticationView: View {
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                    .scaleEffect(1.15)
                
                VStack(spacing: 120) {
                    LogoLabel()
                    VStack(spacing: 20) {
                        NavigationLink(
                            destination: LoginView(),
                            label: {
                                Text("Sign in")
                                    .modifier(
                                        ButtonStyleModifier(
                                            width: 320,
                                            height: 38,
                                            background: .black,
                                            foreground: .white
                                        )
                                    )
                        })
                        NavigationLink(
                            destination:
                                RegistrationView().environmentObject(userManager),
                            label: {
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
                        )
                    }
                }
            }
        }
    }
}

#Preview {
    AuthenticationView()
        .environmentObject(UserManager())
}
