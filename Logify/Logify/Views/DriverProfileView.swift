//
//  DriversProfileView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import SwiftUI

struct DriverProfileView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color.background
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        Image("user")
                            .resizable()
                            .frame(width: 100, height: 100)
                            
                        Text("Name Surname")
                            .font(.title)
                            .bold()
                        
                        Text("phone number")
                    }
                    
                    Form {
                        Section {
                            NavigationLink("Employer") {
                                DriverEmployerView()
                            }
                        }
                        
                        Section("Settings") {
                            Picker("GPS", selection: .constant(1)) {
                                Text("Default")
                                Text("Wialon")
                            }
                            .pickerStyle(.navigationLink)
                            
                            Picker("Language", selection: .constant(1)) {
                                Text("English")
                                Text("Polish")
                                Text("German")
                            }
                            .pickerStyle(.navigationLink)
                            
                            
                            .pickerStyle(.automatic)
                            Toggle("Notifications", isOn: .constant(true))
                        }
                        
                        Section {
                            Button("Log out", role: .destructive) {
                                
                            }
                        }
                        
                    }
                    .scrollContentBackground(.hidden)
                    
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DriverProfileView()
}
