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
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    if let driver = newCargoViewModel.driver {
                        DriverDetailsRow(driver: driver)
                            .padding(.vertical)
                        NavigationLink("Change") {
                            DriverSelectionView()
                        }
                        .foregroundStyle(.blue)
                    } else {
                        Text("Driver doesn't selected yet")
                            .frame(maxWidth: .infinity)
                            .font(.subheadline)
                            .padding(.vertical)
                        NavigationLink("Select") {
                            DriverSelectionView()
                        }
                        .foregroundStyle(.blue)
                    }
                } header: {
                    SectionHeader(text: "Driver")
                }
                
                Section {
                    if let car = newCargoViewModel.car {
                        NewCargoCarDetailsRow(
                            plate: car.plate,
                            brand: car.brand,
                            model: car.model
                        )
                        NavigationLink("Change") {
                            CarSelectionView()
                        }
                        .foregroundStyle(.blue)
                    } else {
                        Text("Car doesn't selected yet")
                            .frame(maxWidth: .infinity)
                            .font(.subheadline)
                            .padding(.vertical)
                        NavigationLink("Select") {
                            CarSelectionView()
                        }
                        .foregroundStyle(.blue)
                    }
                } header: {
                    SectionHeader(text: "Car")
                }
                
                Section {
                    TextField("Description", text: $description, axis: .vertical)
                }
                
                Section {
                    if newCargoViewModel.points.isEmpty {
                        Text("Route doesn't created yet")
                            .frame(maxWidth: .infinity)
                            .font(.subheadline)
                            .padding(.vertical)
                        NavigationLink("Create") {
                            NewPointView()
                        }
                        .foregroundStyle(.blue)
                    } else {
                        VStack (spacing: 0){
                            ForEach(newCargoViewModel.points.dropLast(), id: \.id) { point in
                                CargoRouteCell(
                                    name: point.label,
                                    coordinates: point.getCoordinates(),
                                    isLast: false
                                )
                            }
                            .listRowSeparator(.hidden)
                            if let point = newCargoViewModel.points.last {
                                CargoRouteCell(
                                    name: point.label,
                                    coordinates: point.getCoordinates(),
                                    isLast: true
                                )
                            }
                        }
                        NavigationLink("Add point") {
                            NewPointView()
                        }
                        .foregroundStyle(.blue)
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
            }
        }
    }
}

#Preview {
    NewCargoView()
        .environmentObject(NewCargoViewModel())
}


struct NewCargoDriverDetailsRow: View {
    var id: Int
    var fullname: String
    var phoneNumber: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(fullname)
                Spacer()
                Text("#\(id)")
                //Spacer()
                //Text("#\(id)")
            }
            Text("\(phoneNumber)")
            //Text("\(phoneNumber)")
                //.font(.subheadline)
        }
        .padding(.vertical)
    }
}

struct NewCargoCarDetailsRow: View {
    var plate: String
    var brand: String?
    var model: String?
    
    var body: some View {
        HStack {
            Text(plate)
            Spacer()
            if let brand = brand, let model = model {
                Text(brand + " " + model)
            }
        }
    }
}

struct NewCargo {
    var driver: Driver?
    var car: Car?
}
