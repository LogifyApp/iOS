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
                .scaleEffect(1.05)
            
            VStack(spacing: 30) {
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
                .offset(y: -30)

                Button(action: {}){
                    NavigationText(text: "Register", foreground: .white, backround: .black)
                }
            }
        }
    }
}

#Preview {
    RegistrationView()
        .environmentObject(UserManager())
}
