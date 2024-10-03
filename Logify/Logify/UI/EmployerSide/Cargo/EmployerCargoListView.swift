//
//  EmployerCargoListView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct EmployerCargoListView: View {
    @ObservedObject var cargoListViewModel: EmployerCargoListViewModel
    @State private var searchText = ""
    @State private var showNewCargoScreen = false
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
            if cargoListViewModel.cargoList.isEmpty {
                Text("Cargo list is empty")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .background(Color.background)
                    .font(.system(size: 16))
            } else {
                ScrollView {
                    ForEach(searchResults, id: \.id) { cargo in
                        NavigationLink(
                            destination: EmployerCargoDetailsView(
                                cargoViewModel: EmployerCargoViewModel(cargo)
                            )
                        ){
                            CargoDetailsRow(
                                cargoId: cargo.id,
                                cargoStatus: cargo.status
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .searchable(
                        text: $searchText,
                        placement: .navigationBarDrawer(displayMode: .always)
                    )
                }
                .background(Color.background)
                .navigationTitle("Cargo")
                .toolbarTitleDisplayMode(.inline)
                .toolbarBackground(Color.background, for: .navigationBar)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("", systemImage: "plus") {
                            showNewCargoScreen.toggle()
                        }
                    }
                }
                .fullScreenCover(isPresented: $showNewCargoScreen) {
                    DriverSelectionView(newCargoViewModel: NewCargoViewModel())
                }
            }
        }
    }
}

#Preview {
    EmployerCargoListView(cargoListViewModel: EmployerCargoListViewModel())
}
