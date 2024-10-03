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
                    VStack(spacing: 0) {
                        NavigationLink(
                            destination: LoginView(),
                            label: {
                                NavigationText(
                                    text: "Sign in",
                                    foreground: .white,
                                    backround: .black,
                                    width: 320,
                                    height: 40
                                )
                        })
                        NavigationLink(
                            destination:
                                RegistrationView().environmentObject(userManager),
                            label: {
                                NavigationText(
                                    text: "Sign up",
                                    foreground: .white,
                                    backround: .black,
                                    width: 320,
                                    height: 40
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
