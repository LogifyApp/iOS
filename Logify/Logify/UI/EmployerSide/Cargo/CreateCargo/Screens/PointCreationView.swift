//
//  NewPointView.swift
//  Logify
//
//  Created by Vlad Klunduk on 04/10/2024.
//

import SwiftUI
import MapKit

struct PointCreationView: View {
    @ObservedObject var viewModel: PointCreationViewModel
    @State private var showInvalidCoordinatesAlert = false
    
    var body: some View {
        List {
            Section {
                TextField("Point name", text: $viewModel.name, axis: .vertical)
                TextField("Coordinates", text: $viewModel.coordinates, axis: .vertical)
            } footer: {
                Text("You can add coordinates manually or select point on the map")
            }
            Section {
                Button {
                    viewModel.showMap()
                } label: {
                    EmptyView()
                }
                .listRowBackground(Color.background)
                .frame(height: 300)
                .overlay {
                    Map()
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.background)
        .scrollContentBackground(.hidden)
        .scrollDisabled(true)
        .toolbarBackground(.hidden, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    /*
                    if viewModel.validateCoordinates(coordinates) {
                        viewModel.addNewPoint(
                            name: name,
                            coordinatesString: coordinates
                        )
                        dismiss()
                    } else {
                        showInvalidCoordinatesAlert.toggle()
                    }*/
                }
            }
        }
        .alert("Invalid coordinates", isPresented: $showInvalidCoordinatesAlert) {}
    }
}

#Preview {
    NavigationView {
        PointCreationView(viewModel: PointCreationViewModel())
    }
}
