//
//  CarSelectionView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct CarSelectionView: View {
    @EnvironmentObject var newCargoViewModel: NewCargoViewModel
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    private var searchResults: [Car] {
        if searchText.isEmpty {
            return newCargoViewModel.cars
        } else {
            return newCargoViewModel.cars
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
                                newCargoViewModel.car = car
                                dismiss()
                            }
                    }
                }
            }
        }
        .navigationTitle("Cars")
        .toolbarTitleDisplayMode(.inline)
        .toolbarBackground(Color.background, for: .navigationBar)
        .background(Color.background)
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer(displayMode: .always)
        )
    }
}

#Preview {
    NavigationView {
        CarSelectionView()
            .environmentObject(NewCargoViewModel())
    }
}
