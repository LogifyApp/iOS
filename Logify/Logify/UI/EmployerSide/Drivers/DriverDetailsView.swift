//
//  DriverDetailsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 11/10/2024.
//

import SwiftUI

struct DriverDetailsView: View {
    @ObservedObject var viewModel: EmployerDriversListViewModel
    @Binding var isTabViewPresented: Bool
    var driver: Driver
    
    var body: some View {
        List {
            Section {
                ListDetailRow(
                    property: "ID",
                    value: "#\(driver.id)"
                )
                ListDetailRow(
                    property: "Name",
                    value: driver.name
                )
                ListDetailRow(
                    property: "Surname",
                    value: driver.surname
                )
                ListDetailRow(
                    property: "Phone number",
                    value: "\(driver.phoneNumber)"
                )
                ListDetailRow(
                    property: "Status",
                    value: driver.status
                )
            }
            Section {
                Button("Chat") {
                    
                }
            }
            Section {
                Button("Remove", role: .destructive) {
                    
                }
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.background)
        .scrollContentBackground(.hidden)
        .onAppear {
            withAnimation {
                isTabViewPresented = false
            }
        }
    }
}

#Preview {
    NavigationView {
        DriverDetailsView(
            viewModel: EmployerDriversListViewModel(),
            isTabViewPresented: .constant(false),
            driver: Driver(id: 2, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "", status: "Available")
        )
    }
}
