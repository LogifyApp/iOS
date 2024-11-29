//
//  CarDetailsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/11/2024.
//

import SwiftUI

struct CarDetailsView: View {
    @ObservedObject var viewModel: CarsListViewModel
    @State private var isRemoveConfirmationPresented = false
    @Binding var isTabViewPresented: Bool
    var car: Car
    
    var body: some View {
        List {
            Section {
                ListDetailRow(
                    property: "Plate number",
                    value: car.plate
                )
                if let brand = car.brand {
                    ListDetailRow(
                        property: "Brand",
                        value: brand
                    )
                }
                if let model = car.model {
                    ListDetailRow(
                        property: "Model",
                        value: model
                    )
                }
                ListDetailRow(
                    property: "Status",
                    value: "\(car.status)"
                )
                Button("Edit") {
                    isRemoveConfirmationPresented = true
                }
            }
            .listRowBackground(Color.component)
            Section {
                Button("Remove", role: .destructive) {
                    isRemoveConfirmationPresented = true
                }
            }
            .listRowBackground(Color.component)
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.background)
        .scrollContentBackground(.hidden)
        .toolbarBackground(.thinMaterial, for: .navigationBar)
        .onAppear {
            withAnimation {
                isTabViewPresented = false
            }
        }
        .confirmationDialog("Remove driver", isPresented: $isRemoveConfirmationPresented) {
            Button("Remove", role: .destructive) {
                
            }
        } message: {
            Text("Are you sure you want to remove this driver?")
        }
    }
}

#Preview {
    CarDetailsView(
        viewModel: CarsListViewModel(),
        isTabViewPresented: .constant(false),
        car: Car(plate: "AA1111", status: 1, isDeleted: 1, employerId: 1)

    )
}
