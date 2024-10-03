//
//  EmployerProfileView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct EmployerProfileView: View {
    @ObservedObject var profileViewModel: EmployerProfileViewModel
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    UserDataRow(
                        user: profileViewModel.employer,
                        imageWidth: 90
                    )
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
    EmployerProfileView(profileViewModel: EmployerProfileViewModel())
}
