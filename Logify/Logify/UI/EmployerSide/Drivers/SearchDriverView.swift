//
//  SearchDriverView.swift
//  Logify
//
//  Created by Vlad Klunduk on 11/10/2024.
//

import SwiftUI

struct SearchDriverView: View {
    @ObservedObject var viewModel: EmployerDriversListViewModel
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    private var searchResults: [Driver] {
        viewModel.drivers
            .filter {
                String($0.phoneNumber).contains(searchText)
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
                                NewDriverDetailsView(driver: driver)
                            } label: {
                                NewDriverCell(driver: driver)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .navigationTitle("New Driver")
            .toolbarTitleDisplayMode(.inline)
            .background(Color.background)
            .toolbarBackground(.thinMaterial, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: Text("Phone number")
            )
        }
    }
}

#Preview {
    SearchDriverView(viewModel: EmployerDriversListViewModel())
}
