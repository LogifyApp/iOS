//
//  DriverProfileEmployerView.swift
//  Logify
//
//  Created by Vlad Klunduk on 27/07/2024.
//

import SwiftUI

struct DriverEmployerView: View {
    
    @EnvironmentObject var driverManager: DriverManager
    @State private var requests: [Employer] = []
    
    var body: some View {
        List {
            Section {
                if let employer = driverManager.getActiveEmployer() {
                    ActiveEmployerRow(employer: employer)
                        .padding(6)
                } else {
                    Text("There is no active employer")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                }
            } header: {
                SectionHeader(text: "Employer")
            }

            Section {
                if requests.isEmpty {
                    Text("There is no active requests")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical)
                } else {
                    ForEach(requests, id: \.id){ employer in
                        RequestEmployerRow(employer: employer) {
                            driverManager.acceptRequest(with: employer.id)
                            requests = driverManager.getEmployersRequests()
                        } declineRequest: {
                            driverManager.declineRequest(with: employer.id)
                            requests = driverManager.getEmployersRequests()
                        }
                    }
                }
            } header: {
                SectionHeader(text: "Requests")
            }
        }
        .background(Color.background)
        .scrollContentBackground(.hidden)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            requests = driverManager.getEmployersRequests()
        }
    }
}

#Preview {
    NavigationView {
        DriverEmployerView()
            .environmentObject(DriverManager())
    }
}
