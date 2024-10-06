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
            VStack {
                if searchResults.isEmpty {
                    Text("Cargo list is empty")
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .background(Color.background)
                        .font(.system(size: 16))
                } else {
                    ScrollView {
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
                    }
                    .navigationTitle("Cargo")
                    .toolbarTitleDisplayMode(.inline)
                    .background(Color.background)
                    .toolbarBackground(.hidden, for: .tabBar)
                    .toolbarBackground(Color.background, for: .navigationBar)
                }
            }
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always)
            )
        }
    }
}

#Preview {
    DriverCargoListView(cargoListViewModel: CargoListViewModel())
}
