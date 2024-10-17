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
    @State private var isNewCargoViewPresented = false
    @Binding var isTabViewPresented: Bool
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
                        .font(.subheadline)
                } else {
                    ScrollView {
                        ForEach(searchResults, id: \.id) { cargo in
                            NavigationLink(
                                destination: EmployerCargoDetailsView(
                                    cargoViewModel: EmployerCargoViewModel(cargo),
                                    isTabViewPresented: $isTabViewPresented
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
                }
            }
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
                NewCargoView()
                    .environmentObject(NewCargoViewModel())
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
    EmployerCargoListView(cargoListViewModel: EmployerCargoListViewModel(), isTabViewPresented: .constant(true))
}
