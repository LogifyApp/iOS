//
//  CarSelectionView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct CarSelectionView: View {
    @ObservedObject var newCargoViewModel: NewCargoViewModel
    @State private var searchText = ""
    var searchResults: [Car] {
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
                    .font(.system(size: 16))
            } else {
                ScrollView {
                    ForEach(searchResults, id: \.plate) { car in
                        NavigationLink {
                            PointsSelectionView()
                        } label: {
                            CarDetailsRow(car: car)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .navigationTitle("Car Selection")
                .toolbarTitleDisplayMode(.inline)
                .toolbarBackground(Color.background, for: .navigationBar)
            }
        }
        .background(Color.background)
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer(displayMode: .always)
        )
    }
}

#Preview {
    NavigationView {
        CarSelectionView(newCargoViewModel: NewCargoViewModel())
    }
}
