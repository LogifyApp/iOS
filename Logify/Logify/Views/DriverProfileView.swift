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
                    /*HStack {
                        Image("user")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding(.horizontal)
                        
                        VStack(alignment: .leading) {
                            Text("Name Surname")
                                .font(.title2)
                                .bold()
                            
                            Text("phone number")
                            
                            
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()*/

                    Form {
                        Section {
                            HStack {
                                Image("user")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .padding(.trailing)
                                
                                VStack(alignment: .leading) {
                                    Text("Name Surname")
                                        .font(.title3)
                                        .bold()
                                    Text("phone number")
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical)
                        }
                        
                        Section {
                            NavigationLink("Employer") {
                                DriverEmployerView()
                            }
                            Picker("Tracker", selection: .constant(1)) {
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
                    .scrollContentBackground(.hidden)
                    
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    DriverProfileView()
}
