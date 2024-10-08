//
//  DriversProfileView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import SwiftUI

struct DriverProfileView: View {
    
    @ObservedObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    UserDataRow(
                        user: profileViewModel.driver,
                        imageWidth: 90
                    )
                }
                
                Section {
                    NavigationLink("Employer") {
                        DriverEmployerView(profileViewModel: profileViewModel)
                    }
                    Picker("Tracking", selection: .constant(1)) {
                        Text("Default")
                        Text("Wialon")
                    }
                    .pickerStyle(.navigationLink)
                }
                
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
                        
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.large)
            .background(Color.background)
            .scrollContentBackground(.hidden)
        }
        .toolbarBackground(.hidden, for: .tabBar)
    }
}

#Preview {
    DriverProfileView(profileViewModel: ProfileViewModel())
}
