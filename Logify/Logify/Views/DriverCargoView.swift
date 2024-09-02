//
//  DriversCargoView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import SwiftUI

struct DriverCargoView: View {
    
    @State private var cargo = [Cargo(id: 137287897, description: "iaybdcuwybec", status: "Created", creationDate: Date.now, carId: "24987", points: [])]
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.background
                    .ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(cargo, id: \.id) { cargo in
                            NavigationLink(destination: CargoDetailsView(cargo: cargo)) {
                                CargoCell(cargoId: cargo.id,
                                          cargoStatus: cargo.status
                                )
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .navigationTitle("Cargo")
            .toolbarTitleDisplayMode(.inline)
            .toolbarBackground(.hidden, for: .tabBar)
            .toolbarBackground(Color.background, for: .navigationBar)
        }
        .searchable(text: .constant(""), placement: .navigationBarDrawer(displayMode: .always))
    }
}

#Preview {
    DriverCargoView()
}
