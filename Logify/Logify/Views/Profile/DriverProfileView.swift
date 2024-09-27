//
//  DriversProfileView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import SwiftUI

struct DriverProfileView: View {
    
    @EnvironmentObject var driverManager: DriverManager
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    DriverProfileRow()
                }
                
                Section {
                    NavigationLink("Employer") {
                        DriverEmployerView()
                    }
                    Picker("Tracking", selection: .constant(1)) {
                        Text("Default")
                        Text("Wialon")
                    }
                    .pickerStyle(.navigationLink)
                } header: {
                    SectionHeader(text: "Delivery")
                }
                
                Section {
                    Picker("Language", selection: .constant(1)) {
                        Text("English")
                        Text("Polish")
                        Text("German")
                    }
                    .pickerStyle(.navigationLink)
                    Toggle("Notifications", isOn: .constant(true))
                    Toggle("Dark mode", isOn: .constant(true))
                } header: {
                    SectionHeader(text: "General")
                }
                
                Section {
                    Button("Log out", role: .destructive) {
                        
                    }
                }
            }
            .background(Color.background)
            .scrollContentBackground(.hidden)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.large)
        .toolbarBackground(.hidden, for: .tabBar)
    }
}

#Preview {
    DriverProfileView()
        .environmentObject(DriverManager())
}
