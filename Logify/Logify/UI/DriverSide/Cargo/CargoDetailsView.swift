//
//  CargoDetailsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 22/08/2024.
//

import SwiftUI

struct CargoDetailsView: View {
    
    @ObservedObject var cargoViewModel: CargoViewModel
    @State private var isMapPresented = false
    
    var body: some View {
        List {
            // MARK: Details
            Section {
                CargoDetailsCell(
                    property: "Cargo ID",
                    value: "\(cargoViewModel.cargo.id)"
                )
                CargoDetailsCell(
                    property: "Status",
                    value: cargoViewModel.cargo.status
                )
                CargoDetailsCell(
                    property: "Creation date",
                    value: "\(cargoViewModel.cargo.creationDate.formatted(date: .numeric, time: .omitted))"
                )
                CargoDetailsCell(
                    property: "Car ID",
                    value: cargoViewModel.cargo.carId
                )
                NavigationLink {
                    CargoDocumentsView(cargoViewModel: cargoViewModel)
                } label: {
                    Text("Documents")
                        .foregroundStyle(.secondary)
                }
            }
            
            // MARK: Description
            Section {
                Text(cargoViewModel.cargo.description)
            }
            
            // MARK: Route
            Section {
                VStack(spacing: 0) {
                    ForEach(cargoViewModel.points.dropLast(), id: \.id) { point in
                        CargoRouteCell(
                            name: point.label,
                            coordinates: point.getCoordinates(),
                            isLast: false
                        )
                    }
                    if let point = cargoViewModel.points.last {
                        CargoRouteCell(
                            name: point.label,
                            coordinates: point.getCoordinates(),
                            isLast: true
                        )
                    }
                }
                .padding(.bottom, -16)
                Button(action: { isMapPresented.toggle() }) {
                     HStack {
                         Image(systemName: "map")
                         Text("Map")
                     }
                     .modifier(
                         ButtonStyle(
                            width: 310,
                            height: 36,
                            background: .black,
                            foreground: .white
                         )
                     )
                 }
                 .fullScreenCover(isPresented: $isMapPresented) {
                     MapView(mapViewModel:
                            MapViewModel(points: cargoViewModel.points)
                     )
                 }
                 .padding(.bottom, 4)
            }
            .listRowSeparator(.hidden)
        }
        .navigationTitle("Details")
        .toolbarTitleDisplayMode(.inline)
        .scrollContentBackground(.hidden)
        .background(Color.background)
    }
}


#Preview {
    NavigationView {
        CargoDetailsView(cargoViewModel: CargoViewModel())
    }
}


struct CargoDetailsCell: View {
    
    let property: String
    let value: String
    
    var body: some View {
        HStack {
            Text(property)
                .foregroundStyle(.secondary)
            Spacer()
            Text(value)
        }
    }
}
