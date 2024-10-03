//
//  DriverProfileEmployerView.swift
//  Logify
//
//  Created by Vlad Klunduk on 27/07/2024.
//

import SwiftUI

struct DriverEmployerView: View {
    
    @ObservedObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        List {
            Section {
                if let employer = profileViewModel.employer {
                    UserDataRow(user: employer, imageWidth: 70)
                } else {
                    Text("You don't have active employer")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                }
            }

            Section {
                if profileViewModel.employersRequests.isEmpty {
                    Text("You don't have active requests")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                } else {
                    ForEach(profileViewModel.employersRequests, id: \.id){ employer in
                        RequestEmployerRow(employer: employer) {
                            profileViewModel.acceptRequest(with: employer.id)
                        } declineRequest: {
                            profileViewModel.declineRequest(with: employer.id)
                        }
                    }
                }
            } header: {
                SectionHeader(text: "Requests")
            }
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
