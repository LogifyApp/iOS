//
//  DirverEmployerView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/10/2024.
//

import SwiftUI

struct DriverEmployerView: View {
    @ObservedObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            if let employer = profileViewModel.employer {
                UserDataCell(user: employer)
                    .padding(20)
            } else {
                Text("You don't have active employer")
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.white)
                    }
                    .padding(20)
            }
            List {
                Section {
                    if profileViewModel.employersRequests.isEmpty {
                        Text("You don't have active requests")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 30)
                    } else {
                        ForEach(profileViewModel.employersRequests, id: \.id){ employer in
                            NavigationLink {
                                EmployerRequestDetailsView(employer: employer)
                            } label: {
                                Text(employer.getFullName())
                            }
                        }
                    }
                } header: {
                    SectionHeader(text: "Requests")
                }
            }
            .scrollContentBackground(.hidden)
        }
        .navigationTitle("Employer")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.background)
        .scrollContentBackground(.hidden)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        DriverEmployerView(profileViewModel: ProfileViewModel())
    }
}
