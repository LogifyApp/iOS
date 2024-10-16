//
//  EmployerDriversListView.swift
//  Logify
//
//  Created by Vlad Klunduk on 11/10/2024.
//

import SwiftUI

struct EmployerDriversListView: View {
    @ObservedObject var viewModel: EmployerDriversListViewModel
    @State private var searchText = ""
    @State private var isSearchDriverViewPresented = false
    @Binding var isTabViewPresented: Bool
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
        NavigationView {
            VStack {
                if searchResults.isEmpty {
                    Text("Drivers list is empty")
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .font(.subheadline)
                } else {
                    ScrollView {
                        ForEach(searchResults, id: \.id) { driver in
                            NavigationLink {
                                DriverDetailsView(
                                    viewModel: viewModel,
                                    isTabViewPresented: $isTabViewPresented,
                                    driver: driver
                                )
                            } label: {
                                DriverDetailsCell(driver: driver)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .navigationTitle("Drivers")
            .toolbarTitleDisplayMode(.inline)
            .background(Color.background)
            .toolbarBackground(.thinMaterial, for: .navigationBar)
            .toolbarBackground(.hidden, for: .tabBar)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "plus")
                        .foregroundStyle(.blue)
                        .onTapGesture {
                            isSearchDriverViewPresented.toggle()
                        }
                }
            }
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .automatic)
            )
            .fullScreenCover(isPresented: $isSearchDriverViewPresented) {
                SearchDriverView(viewModel: viewModel)
            }
            .onAppear {
                withAnimation {
                    isTabViewPresented = true
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        EmployerDriversListView(
            viewModel: EmployerDriversListViewModel(),
            isTabViewPresented: .constant(true)
        )
    }
}
