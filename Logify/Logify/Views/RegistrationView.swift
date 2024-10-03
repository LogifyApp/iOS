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
                    RegistrationTextField(savedText: $userManager.user.name, placeholder: "Name")
                    RegistrationTextField(savedText: $userManager.user.surname, placeholder: "Surname")
// TODO: cast phone number string value to int
                    RegistrationTextField(savedText: .constant(""), placeholder: "Phone number")
                    RegistrationTextField(savedText: $userManager.user.password, placeholder: "Password")
                }
                Button(action: {}){
                    NavigationText(
                        text: "Sign up",
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

#Preview {
    RegistrationView()
        .environmentObject(UserManager())
}
