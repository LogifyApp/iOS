//
//  CargoDetailsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 22/08/2024.
//

import SwiftUI

struct CargoDetailsView: View {
    
    @ObservedObject var cargoManager: CargoManager
    @State private var isMapPresented = false
    
    var body: some View {
        List {
            // MARK: Details
            Section {
                CargoDetailsCell(property: "Cargo ID",
                                 value: String(cargoManager.selectedCargo.id))
                CargoDetailsCell(property: "Status",
                                 value: cargoManager.selectedCargo.status)
                CargoDetailsCell(property: "Creation date",
                                 value: "\(cargoManager.selectedCargo.creationDate)")
                CargoDetailsCell(property: "Car ID",
                                 value: cargoManager.selectedCargo.carId)
                NavigationLink {
                    CargoDocumentsView()
                } label: {
                    Text("Documents")
                        .foregroundStyle(.secondary)
                }
            }
            
            // MARK: Description
            Section {
                Text(cargoManager.selectedCargo.description)
            }
            
            // MARK: Route
            Section {
                VStack(spacing: 0) {
                    ForEach(cargoManager.selectedCargo.points.dropLast(), id: \.id) { point in
                        CargoRouteCell(name: point.label,
                                       coordinates: "\(point.latitude) \(point.longtitude)",
                                       isLast: false)
                    }
                    CargoRouteCell(name: cargoManager.selectedCargo.points.last!.label,
                                   coordinates: "\(cargoManager.selectedCargo.points.last!.latitude) \(cargoManager.selectedCargo.points.last!.longtitude)",
                                   isLast: true)
                }
                .padding(.bottom, -16)
                Button(action: { isMapPresented.toggle() }) {
                     HStack {
                         Image(systemName: "map")
                         Text("Map")
                     }
                     .modifier(
                         ButtonModifier(width: 310,
                         height: 36,
                         background: .black,
                         foreground: .white)
                     )
                 }
                 .fullScreenCover(isPresented: $isMapPresented) {
                     MapView(points: cargoManager.selectedCargo.points)
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
    CargoDetailsView(cargoManager: CargoManager())
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
