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
    @Environment(\.dismiss) var dismiss
    private var searchResults: [Driver] {
        if searchText.isEmpty {
            return viewModel.fetchDriversList()
        } else {
            return viewModel.fetchDriversList()
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
                                dismiss()
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
            .environmentObject(CargoCreationViewModel())
    }
}
