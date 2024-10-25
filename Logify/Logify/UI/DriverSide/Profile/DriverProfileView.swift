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
            VStack {
                UserDataCell(user: profileViewModel.driver)
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
                            
                        }
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
    }
}

#Preview {
    DriverProfileView(profileViewModel: ProfileViewModel())
}
