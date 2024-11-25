//
//  CargoCreationView.swift
//  Logify
//
//  Created by Vlad Klunduk on 04/10/2024.
//

import SwiftUI

struct CargoCreationView: View {
    @EnvironmentObject var viewModel: CargoCreationViewModel
    @Environment(\.dismiss) var dismiss
    @State private var pointWasTapped = false
    @State private var isReturnConfirmationPresented = false
    
    var body: some View {
        NavigationView {
            List {
                //MARK: Driver
                Section {
                    if let driver = viewModel.driver {
                        DriverDetailsRow(driver: driver)
                            .padding(.top)
                        Text("Change")
                            .foregroundStyle(.blue)
                            .overlay {
                                NavigationLink("") {
                                    DriverSelectionView()
                                }
                                .opacity(0)
                            }
                    } else {
                        NewCargoEmptyElementView(text: "Doesn't selected yet")
                        Text("Select")
                            .foregroundStyle(.blue)
                            .overlay {
                                NavigationLink("") {
                                    DriverSelectionView()
                                }
                                .opacity(0)
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
                        Text("Change")
                            .foregroundStyle(.blue)
                            .overlay {
                                NavigationLink("") {
                                    CarSelectionView()
                                }
                                .opacity(0)
                            }
                    } else {
                        NewCargoEmptyElementView(text: "Doesn't selected yet")
                        Text("Select")
                            .foregroundStyle(.blue)
                            .overlay {
                                NavigationLink("") {
                                    CarSelectionView()
                                }
                                .opacity(0)
                            }
                    }
                } header: {
                    SectionHeader(text: "Car")
                }
                //MARK: Description
                Section {
                    TextField("Description", 
                              text: $viewModel.description,
                              axis: .vertical
                    )
                }
                //MARK: Route
                Section {
                    if viewModel.points.isEmpty {
                        NewCargoEmptyElementView(text: "Doesn't created yet")
                        Text("Create")
                            .foregroundStyle(.blue)
                            .overlay {
                                NavigationLink("") {
                                    PointCreationView()
                                }
                                .opacity(0)
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
                        Text("Edit")
                            .foregroundStyle(.blue)
                            .overlay {
                                NavigationLink("") {
                                    RouteEditingView()
                                }
                                .opacity(0)
                            }
                        Text("Add point")
                            .foregroundStyle(.blue)
                            .overlay {
                                NavigationLink("") {
                                    PointCreationView()
                                }
                                .opacity(0)
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
}

#Preview {
    CargoCreationView()
        .environmentObject(CargoCreationViewModel())
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
