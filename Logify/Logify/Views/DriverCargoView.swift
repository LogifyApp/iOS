//
//  DriversCargoView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import SwiftUI

struct DriverCargoView: View {
    
    @State private var searchText = ""
    var cargo: [Cargo]
    var searchResults: [Cargo] {
        if searchText.isEmpty {
            return cargo
        } else {
            return cargo.filter({ String($0.id).contains(searchText) })
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.background
                    .ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(searchResults, id: \.id) { cargo in
                            NavigationLink(destination: CargoDetailsView(cargo: cargo)) {
                                CargoCell(cargoId: cargo.id,
                                          cargoStatus: cargo.status)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                    }
                }
            }
            .navigationTitle("Cargo")
            .toolbarTitleDisplayMode(.inline)
            .toolbarBackground(.hidden, for: .tabBar)
            .toolbarBackground(Color.background, for: .navigationBar)
        }
    }
}

#Preview {
    DriverCargoView(cargo: [
        Cargo(id: 137287897,
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
              ]),
        Cargo(id: 256365346,
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
    ])
}
