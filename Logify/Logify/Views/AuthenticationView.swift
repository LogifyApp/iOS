//
//  SwiftUIView.swift
//  Logify
//
//  Created by Vlad Klunduk on 22/07/2024.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .scaleEffect(1.05)
            
            VStack(spacing: 70) {
                VStack(spacing: 0){
                    Image("logo")
                        .resizable()
                        .frame(width: 200, height: 200)
                    Text("Logify")
                        .font(.system(size: 40))
                        .fontWeight(.semibold)
                }
            
                VStack(spacing: 10) {
                    SubmitButton(text: "Log in", action: { LoginView() }, foreground: .white, backround: .black)
                    SubmitButton(text: "Register", action: {}, foreground: .white, backround: .black)
                }
                
            }
        }
    }
}

#Preview {
    AuthenticationView()
}
