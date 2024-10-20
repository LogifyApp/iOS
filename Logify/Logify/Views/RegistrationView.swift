//
//  RegistrationView.swift
//  Logify
//
//  Created by Vlad Klunduk on 21/07/2024.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .scaleEffect(1.15)
            
            VStack(spacing: 20) {
                Image("logo")
                    .resizable()
                    .frame(width: 200, height: 200)
    
                VStack(spacing: 20){
                    RolePicker()
                    CustomTextField(
                        savedText: $userManager.user.name,
                        placeholder: "Name"
                    )
                    CustomTextField(
                        savedText: $userManager.user.surname,
                        placeholder: "Surname"
                    )
// TODO: cast phone number string value to int
                    CustomTextField(
                        savedText: .constant(""),
                        placeholder: "Phone number"
                    )
                    CustomTextField(
                        savedText: $userManager.user.password,
                        placeholder: "Password"
                    )
                }
                Button(action: {}) {
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
    }
}

#Preview {
    RegistrationView()
        .environmentObject(UserManager())
}
