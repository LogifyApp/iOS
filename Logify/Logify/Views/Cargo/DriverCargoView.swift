//
//  DriversCargoView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import SwiftUI

struct DriverCargoView: View {
    
    @EnvironmentObject private var driverManager: DriverManager
    @State private var searchText = ""
    var searchResults: [Cargo] {
        if searchText.isEmpty {
            return driverManager.fetchAllCargo()
        } else {
            return driverManager.fetchAllCargo()
                .filter({ String($0.id).contains(searchText) })
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(searchResults, id: \.id) { cargo in
                        NavigationLink(destination: CargoDetailsView(cargoManager: CargoManager(cargo))) {
                            CargoCell(
                                cargoId: cargo.id,
                                cargoStatus: cargo.status
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                            
                    }
                    .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                }
            }
            .navigationTitle("Cargo")
            .toolbarTitleDisplayMode(.inline)
            .background(Color.background)
            .toolbarBackground(.hidden, for: .tabBar)
            .toolbarBackground(Color.background, for: .navigationBar)
        }
    }
}

#Preview {
    DriverCargoView()
        .environmentObject(DriverManager())
}
