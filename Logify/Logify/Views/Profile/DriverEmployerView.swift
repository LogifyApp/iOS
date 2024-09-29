//
//  DriverProfileEmployerView.swift
//  Logify
//
//  Created by Vlad Klunduk on 27/07/2024.
//

import SwiftUI

struct DriverEmployerView: View {
    
    @EnvironmentObject var driverManager: DriverManager
    
    var body: some View {
        List {
            Section {
                if let employer = driverManager.getActiveEmployer() {
                    UserDataRow(user: employer, imageWidth: 70)
                } else {
                    Text("There is no active employer")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                }
            }

            Section {
                if driverManager.employersRequests.isEmpty {
                    Text("There is no active requests")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                } else {
                    ForEach(driverManager.employersRequests, id: \.id){ employer in
                        RequestEmployerRow(employer: employer) {
                            driverManager.acceptRequest(with: employer.id)
                        } declineRequest: {
                            driverManager.declineRequest(with: employer.id)
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
        DriverEmployerView()
            .environmentObject(DriverManager())
    }
}
