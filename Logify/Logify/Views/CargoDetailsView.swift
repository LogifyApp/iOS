//
//  CargoDetailsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 22/08/2024.
//

import SwiftUI

struct CargoDetailsView: View {
    
    let cargo: Cargo
    
    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
            List {
                // MARK: Details
                Section {
                    CargoDetailsCell(property: "Cargo ID",
                                     value: String(cargo.id))
                    CargoDetailsCell(property: "Status",
                                     value: cargo.status)
                    CargoDetailsCell(property: "Creation date",
                                     value: "\(cargo.creationDate)")
                    CargoDetailsCell(property: "Car ID", 
                                     value: cargo.carId)
                }
                
                // MARK: Description
                Section {
                    Text(cargo.description)
                }

                // MARK: Route
                Section {
                    VStack(spacing: 0) {
                        ForEach(cargo.points.dropLast(), id: \.id) { point in
                            CargoRouteRegularCell(name: point.label,
                                                  coordinates: "\(point.latitude) \(point.longtitude)",
                                                  isLast: false)
                        }
                        CargoRouteRegularCell(name: cargo.points.last!.label,
                                              coordinates: "\(cargo.points.last!.latitude) \(cargo.points.last!.longtitude)",
                                              isLast: true)
                        Button(action: {}) {
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
                        .padding(.bottom, 8)
                        .padding(.top, -8)
                    }
                }
            }
            .scrollContentBackground(.hidden)
        }
        .navigationTitle("Details")
        .toolbarTitleDisplayMode(.inline)
    }
}


#Preview {
    CargoDetailsView(cargo: Cargo(id: 137287897,
                                  description: "iaybdcuwybec",
                                  status: "Created",
                                  creationDate: Date.now,
                                  carId: "24987",
                                  points: [
                                    Point(id: 0,
                                          label: "kubsirv wjw r krju",
                                          latitude: 238642,
                                          longtitude: 2453534,
                                          order: 1456343),
                                    Point(id: 1,
                                          label: "kubsirv wjw r krju",
                                          latitude: 238642,
                                          longtitude: 2453534,
                                          order: 1456343)
                                  ])
    )
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

struct CargoRouteRegularCell: View {
    
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
                //Image(systemName: "mappin")
                Text(coordinates)
                    .font(.system(size: 16))
                Button(action: {
                    UIPasteboard.general.string = coordinates
                }) {
                    Image(systemName: "rectangle.portrait.on.rectangle.portrait")
                }
                .buttonStyle(PlainButtonStyle())
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}
