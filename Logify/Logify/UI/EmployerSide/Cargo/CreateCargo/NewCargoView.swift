//
//  CargoCreationView.swift
//  Logify
//
//  Created by Vlad Klunduk on 04/10/2024.
//

import SwiftUI

struct NewCargoView: View {
    @EnvironmentObject var newCargoViewModel: NewCargoViewModel
    @Environment(\.dismiss) var dismiss
    @State private var description = ""
    @State private var pointWasTapped = false
    
    var body: some View {
        NavigationView {
            List {
                //MARK: Driver
                Section {
                    if let driver = newCargoViewModel.driver {
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
                    if let car = newCargoViewModel.car {
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
                              text: $description,
                              axis: .vertical
                    )
                }
                //MARK: Route
                Section {
                    if newCargoViewModel.points.isEmpty {
                        NewCargoEmptyElementView(text: "Doesn't created yet")
                        Text("Create")
                            .foregroundStyle(.blue)
                            .overlay {
                                NavigationLink("") {
                                    NewPointView()
                                }
                                .opacity(0)
                            }
                    } else {
                        VStack {
                            ForEach(newCargoViewModel.points, id: \.id) { point in
                                PointRow(
                                    point: point,
                                    isLast: newCargoViewModel.points.last!.id == point.id
                                )
                                .onTapGesture {
                                    UIPasteboard.general.string = point.getCoordinates()
                                    withAnimation(.snappy) {
                                        pointWasTapped = true
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        withAnimation(.snappy) {
                                            pointWasTapped = false
                                        }
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
                                    NewPointView()
                                }
                                .opacity(0)
                            }
                    }
                } header: {
                    SectionHeader(text: "Route")
                }
            }
            .background(Color.background)
            .scrollContentBackground(.hidden)
            .navigationTitle("New cargo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        
                        dismiss()
                    }
                }
            }
            .overlay {
                if pointWasTapped {
                    Text("Coordinates were copied")
                        .fontWeight(.semibold)
                        .padding()
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(Capsule())
                        .transition(.move(edge: .bottom))
                        .frame(maxHeight: .infinity, alignment: .bottom)
                }
            }
        }
    }
}

#Preview {
    NewCargoView()
        .environmentObject(NewCargoViewModel())
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
