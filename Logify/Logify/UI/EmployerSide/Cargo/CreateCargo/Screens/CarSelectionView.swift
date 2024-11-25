//
//  CarSelectionView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct CarSelectionView: View {
    @EnvironmentObject var viewModel: CargoCreationViewModel
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    private var searchResults: [Car] {
        if searchText.isEmpty {
            return viewModel.cars
        } else {
            return viewModel.cars
                .filter {
                    $0.plate.contains(searchText)
                }
        }
    }
    
    var body: some View {
        VStack {
            if searchResults.isEmpty {
                Text("Cars list is empty")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .font(.subheadline)
            } else {
                ScrollView {
                    ForEach(searchResults, id: \.plate) { car in
                        CarDetailsCell(car: car)
                            .onTapGesture {
                                viewModel.car = car
                                dismiss()
                            }
                    }
                }
            }
        }
        .navigationTitle("Cars")
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
        CarSelectionView()
            .environmentObject(
                CargoCreationViewModel(CargoCreationCoordinator())
            )
    }
}
