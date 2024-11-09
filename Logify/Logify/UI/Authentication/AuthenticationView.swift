//
//  SwiftUIView.swift
//  Logify
//
//  Created by Vlad Klunduk on 22/07/2024.
//

import SwiftUI

struct AuthenticationView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        //NavigationStack {
            VStack {
                LogoLabel()
                    .padding(.top, 100)
                    .padding(.bottom, 180)
                VStack(spacing: 32) {
                    Button {
                        coordinator.push(.login)
                    } label: {
                        Text("Sign in")
                            .frame(width: 320, height: 38)
                            .modifier(
                                ButtonStyleModifier(
                                    background: .black,
                                    foreground: .white
                                )
                            )
                    }
                    Button {
                        coordinator.push(.registration)
                    }  label: {
                        Text("Sign up")
                            .frame(width: 320, height: 38)
                            .modifier(
                                ButtonStyleModifier(
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
        //}
    }
}

#Preview {
    AuthenticationView()
}
