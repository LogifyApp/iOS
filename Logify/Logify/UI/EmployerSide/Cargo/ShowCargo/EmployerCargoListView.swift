//
//  EmployerCargoListView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct EmployerCargoListView: View {
    @ObservedObject var viewModel: EmployerCargoListViewModel
    @State private var searchText = ""
    @State private var isNewCargoViewPresented = false
    @Binding var isTabViewPresented: Bool
    var searchResults: [Cargo] {
        if searchText.isEmpty {
            return viewModel.cargoList
        } else {
            return viewModel.cargoList
                .filter({ String($0.id).contains(searchText) })
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if searchResults.isEmpty {
                    Text("Cargo list is empty")
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .font(.subheadline)
                } else {
                    ScrollView {
                        ForEach(searchResults, id: \.id) { cargo in
                            Button {
                                viewModel.showDetails(cargo)
                            } label: {
                                CargoCell(
                                    cargoId: cargo.id,
                                    cargoStatus: cargo.status
                                )
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .navigationTitle("Cargo")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.background)
            .toolbarBackground(.thinMaterial, for: .navigationBar)
            .toolbarBackground(.hidden, for: .tabBar)
            .toolbar(isTabViewPresented ? .visible : .hidden, for: .tabBar)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "plus") {
                        isNewCargoViewPresented.toggle()
                    }
                }
            }
            .fullScreenCover(isPresented: $isNewCargoViewPresented) {
                CargoCreationView()
                    .environmentObject(CargoCreationViewModel())
            }
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .automatic)
            )
            .onAppear {
                withAnimation {
                    isTabViewPresented = true
                }
            }
        }
    }
}

#Preview {
    EmployerCargoListView(
        viewModel: EmployerCargoListViewModel(coordinator: EmployerCargoCoordinator()),
        isTabViewPresented: .constant(true))
}
