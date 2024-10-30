//
//  EmployerProfileView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct EmployerProfileView: View {
    @ObservedObject var profileViewModel: EmployerProfileViewModel
    @State private var isLogoutConfirmationPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                UserDataCell(user: profileViewModel.employer)
                    .padding([.horizontal, .top], 20)
                List {
                    Section {
                        Picker("Language", selection: .constant(1)) {
                            Text("English")
                        }
                        .pickerStyle(.navigationLink)
                        Toggle("Notifications", isOn: .constant(true))
                        Toggle("Dark mode", isOn: .constant(false))
                    }
                    Section {
                        Button("Log out", role: .destructive) {
                            isLogoutConfirmationPresented = true
                        }
                        .foregroundStyle(.red)
                    }
                }
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                .scrollContentBackground(.hidden)
                .scrollDisabled(true)
            }
            .background(Color.background)
            .confirmationDialog("Log out", isPresented: $isLogoutConfirmationPresented) {
                Button("Log out", role: .destructive) {
                    
                }
            } message: {
                Text("Are you sure you want to log out?")
            }

        }
    }
}

#Preview {
    EmployerProfileView(profileViewModel: EmployerProfileViewModel())
}
