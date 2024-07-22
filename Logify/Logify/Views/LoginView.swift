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
            
            VStack(spacing: 70) {
                VStack(spacing: 10){
                    Image("logo")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Logify")
                        .font(.system(size: 40))
                        .fontWeight(.semibold)
                }
                
                VStack(spacing: 20){
                    RegistrationTextField(savedText: .constant(""), placeholder: "Name")
                    RegistrationTextField(savedText: .constant(""), placeholder: "Surname")
                }
                
                Button(action: {}){
                    NavigationText(text: "Log in", foreground: .white, backround: .black)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
