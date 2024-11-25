//
//  NewCargoView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct DriverSelectionView: View {
    @EnvironmentObject var viewModel: CargoCreationViewModel
    @State private var searchText = ""
    private var searchResults: [Driver] {
        if searchText.isEmpty {
            return viewModel.drivers
        } else {
            return viewModel.drivers
                .filter {
                    $0.getFullName().contains(searchText) || String($0.id).contains(searchText)
                }
        }
    }
    
    var body: some View {
        VStack {
            if searchResults.isEmpty {
                Text("Drivers list is empty")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .font(.subheadline)
            } else {
                ScrollView {
                    ForEach(searchResults, id: \.id) { driver in
                        DriverDetailsCell(driver: driver)
                            .onTapGesture {
                                viewModel.driver = driver
                                viewModel.pop()
                            }
                    }
                }
            }
        }
        .navigationTitle("Drivers")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.background)
        .toolbarBackground(.thinMaterial, for: .navigationBar)
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer(displayMode: .automatic)
        )
    }
}

#Preview {
    NavigationView {
        DriverSelectionView()
            .environmentObject(
                CargoCreationViewModel(CargoCreationCoordinator())
            )
    }
}
