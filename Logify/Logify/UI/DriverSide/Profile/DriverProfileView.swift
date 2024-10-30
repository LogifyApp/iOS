//
//  DriversProfileView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import SwiftUI

struct DriverProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @State private var isLogoutConfirmationPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                UserDataCell(user: viewModel.driver)
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
                .scrollContentBackground(.hidden)
                .scrollDisabled(true)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.background)
            .toolbarBackground(.thinMaterial, for: .navigationBar)
        }
        .confirmationDialog("Log out", isPresented: $isLogoutConfirmationPresented) {
            Button("Log out", role: .destructive) {
                
            }
        } message: {
            Text("Are you sure you want to log out?")
        }
    }
}

#Preview {
    DriverProfileView(viewModel: ProfileViewModel())
}
