//
//  EmployerCargoDetailsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct EmployerCargoDetailsView: View {
    @ObservedObject var cargoViewModel: EmployerCargoViewModel
    @State private var isMapPresented = false
    
    var body: some View {
        List {
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
                    EmployerCargoDocumentsView(cargoViewModel: cargoViewModel)
                } label: {
                    Text("Documents")
                        .foregroundStyle(.secondary)
                }
            }
            Section {
                Text(cargoViewModel.cargo.description)
            }
            Section {
                VStack(spacing: 0) {
                    ForEach(cargoViewModel.points.dropLast(), id: \.id) { point in
                        CargoRouteCell(
                            name: point.label,
                            coordinates: "\(point.latitude) \(point.longtitude)",
                            isLast: false
                        )
                    }
                    CargoRouteCell(
                        name: cargoViewModel.points.last!.label,
                        coordinates: "\(cargoViewModel.points.last!.latitude) \(cargoViewModel.points.last!.longtitude)",
                        isLast: true
                    )
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
        .background(Color.background)
        .navigationTitle("Details")
        .toolbarTitleDisplayMode(.inline)
        .scrollContentBackground(.hidden)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Edit") {
                    
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        EmployerCargoDetailsView(cargoViewModel: EmployerCargoViewModel())
    }
}
