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
                
                VStack(spacing: 70) {
                    VStack(spacing: 0){
                        Image("logo")
                            .resizable()
                            .frame(width: 200, height: 200)
                        Text("Logify")
                            .font(.system(size: 40))
                            .fontWeight(.semibold)
                    }
                    
                    VStack(spacing: 0) {
                        NavigationLink(destination: LoginView(), label: {
                            NavigationText(text: "Log in", foreground: .white, backround: .black)
                        })
                        NavigationLink(
                            destination: RegistrationView().environmentObject(userManager),
                            label: {
                                NavigationText(text: "Register", foreground: .white, backround: .black)
                            }
                        )
                    }
                    .offset(y: 80)
                }
            }
        }
    }
}

#Preview {
    AuthenticationView()
        .environmentObject(UserManager())
}
