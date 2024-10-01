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
                    ForEach(cargoViewModel.cargo.points.dropLast(), id: \.id) { point in
                        CargoRouteCell(
                            name: point.label,
                            coordinates: "\(point.latitude) \(point.longtitude)",
                            isLast: false
                        )
                    }
                    CargoRouteCell(
                        name: cargoViewModel.cargo.points.last!.label,
                        coordinates: "\(cargoViewModel.cargo.points.last!.latitude) \(cargoViewModel.cargo.points.last!.longtitude)",
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
                     MapView(
                        mapViewModel:
                            MapViewModel(
                                points:
                                    cargoViewModel.cargo.points
                            )
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
        CargoDetailsView(cargoViewModel:
                CargoViewModel(
                    Cargo(
                        id: 137287897,
                        description: "Descriptioin",
                        status: "Created",
                        creationDate: Date.now,
                        carId: "24987",
                        points: [
                            Point(id: 0, label: "start", latitude: 52.219420, longtitude: 20.983114, order: 0),
                            Point(id: 1, label: "mokotow", latitude: 52.240238, longtitude: 21.018649, order: 0),
                            Point(id: 2, label: "wola", latitude: 52.260238, longtitude: 21.038649, order: 0),
                            Point(id: 3, label: "bemovo", latitude: 52.220238, longtitude: 20.95649, order: 0)
                        ])
                )
        )
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

struct CargoRouteCell: View {
    
    let name: String
    let coordinates: String
    let isLast: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "circle.dashed")
                .foregroundStyle(.blue)
            Text(name)
                .font(.system(size: 18))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 8)
        
        HStack {
            VStack() {
                if isLast {
                    Image(systemName: "chevron.down")
                        .foregroundStyle(.clear)
                } else {
                    Image(systemName: "chevron.down")
                        .foregroundStyle(.blue)
                    Image(systemName: "chevron.down")
                        .foregroundStyle(.blue)
                }
            }
            .padding(.vertical)
            
            HStack {
                Text(coordinates)
                    .font(.system(size: 16))
                Button(action: {
                    UIPasteboard.general.string = coordinates
                }) {
                    Image(systemName: "rectangle.portrait.on.rectangle.portrait")
                }
                .buttonStyle(PlainButtonStyle())
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        }
    }
}
