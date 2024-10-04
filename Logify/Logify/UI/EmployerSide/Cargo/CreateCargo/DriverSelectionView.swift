//
//  NewCargoView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct DriverSelectionView: View {
    @EnvironmentObject var newCargoViewModel: NewCargoViewModel
    @State private var searchText = ""
    @Environment(\.dismiss) var dismiss
    private var searchResults: [Driver] {
        if searchText.isEmpty {
            return newCargoViewModel.drivers
        } else {
            return newCargoViewModel.drivers
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
                                newCargoViewModel.driver = driver
                                dismiss()
                            }
                    }
                }
                .navigationTitle("Drivers")
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
        DriverSelectionView()
            .environmentObject(NewCargoViewModel())
    }
}
