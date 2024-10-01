//
//  DriversCargoView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import SwiftUI

struct DriverCargoListView: View {
    
    @ObservedObject var cargoListViewModel: CargoListViewModel
    @State private var searchText = ""
    var searchResults: [Cargo] {
        if searchText.isEmpty {
            return cargoListViewModel.cargoList
        } else {
            return cargoListViewModel.cargoList
                .filter({ String($0.id).contains(searchText) })
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(searchResults, id: \.id) { cargo in
                        NavigationLink(
                            destination: CargoDetailsView(
                                    cargoViewModel: CargoViewModel(cargo)
                            )
                        ){
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
    DriverCargoListView(cargoListViewModel:
            CargoListViewModel(
                driver: Driver(id: 1, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "")
            )
    )
}
