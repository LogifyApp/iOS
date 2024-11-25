//
//  CargoCreationView.swift
//  Logify
//
//  Created by Vlad Klunduk on 04/10/2024.
//

import SwiftUI

struct CargoCreationView: View {
    @ObservedObject var viewModel: CargoCreationViewModel
    @Environment(\.dismiss) var dismiss
    @State private var description = ""
    @State private var pointWasTapped = false
    @State private var isReturnConfirmationPresented = false
    
    var body: some View {
        List {
            //MARK: Driver
            Section {
                if let driver = viewModel.driver {
                    DriverDetailsRow(driver: driver)
                        .padding(.top)
                    Button("Change") {
                        viewModel.push(.driver)
                    }
                } else {
                    NewCargoEmptyElementView(text: "Doesn't selected yet")
                    Button("Select") {
                        viewModel.push(.driver)
                    }
                }
            } header: {
                SectionHeader(text: "Driver")
            }
            //MARK: Car
            Section {
                if let car = viewModel.car {
                    CarDetailsRow(car: car)
                        .padding(.top)
                    Button("Change") {
                        viewModel.push(.car)
                    }
                } else {
                    NewCargoEmptyElementView(text: "Doesn't selected yet")
                    Button("Select") {
                        viewModel.push(.car)
                    }
                }
            } header: {
                SectionHeader(text: "Car")
            }
            //MARK: Description
            Section {
                TextField("Description",
                          text: $description,
                          axis: .vertical
                )
            }
            //MARK: Route
            Section {
                if viewModel.points.isEmpty {
                    NewCargoEmptyElementView(text: "Doesn't created yet")
                    Button("Create") {
                        viewModel.push(.point)
                    }
                } else {
                    VStack {
                        ForEach(viewModel.points, id: \.id) { point in
                            PointRow(
                                point: point,
                                isLast: viewModel.points.last!.id == point.id
                            )
                            .onTapGesture {
                                UIPasteboard.general.string = point.getCoordinates()
                                withAnimation {
                                    pointWasTapped = true
                                }
                            }
                        }
                        .listRowSeparator(.hidden, edges: .top)
                    }
                    .padding(.vertical, 8)
                    Button("Edit") {
                        viewModel.push(.editPoints)
                    }
                    Button("Add point") {
                        viewModel.push(.point)
                    }
                }
            } header: {
                SectionHeader(text: "Route")
            } footer: {
                Text("You can copy point coordinates by tapping on it")
            }
        }
        .navigationTitle("New cargo")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.background)
        .scrollContentBackground(.hidden)
        .toolbarBackground(.thinMaterial, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Return") {
                    isReturnConfirmationPresented = true
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    //save cargo
                    dismiss()
                }
            }
        }
        .hud($pointWasTapped, "Coordinates were copied")
        .confirmationDialog("", isPresented: $isReturnConfirmationPresented) {
            Button("Return", role: .destructive) {
                dismiss()
            }
        } message: {
            Text("Changes will not be saved")
        }
        
    }
}

#Preview {
    CargoCreationView(
        viewModel: CargoCreationViewModel(CargoCreationCoordinator())
    ).environmentObject(
        CargoCreationViewModel(CargoCreationCoordinator())
    )
}


struct NewCargoEmptyElementView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity)
            .font(.subheadline)
            .padding(.vertical)
    }
}
