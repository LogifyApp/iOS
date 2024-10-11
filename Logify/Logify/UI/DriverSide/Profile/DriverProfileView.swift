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
                .navigationBarTitleDisplayMode(.inline)
                .scrollContentBackground(.hidden)
                .scrollDisabled(true)
            }
            .background(Color.background)
            .navigationTitle("Profile")
            .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DriverProfileView(profileViewModel: ProfileViewModel())
}


/*
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
 */
