//
//  NewPointView.swift
//  Logify
//
//  Created by Vlad Klunduk on 04/10/2024.
//

import SwiftUI
import MapKit

struct PointCreationView: View {
    @EnvironmentObject var viewModel: CargoCreationViewModel
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var coordinates = ""
    @State private var showInvalidCoordinatesAlert = false
    
    var body: some View {
        List {
            Section {
                TextField("Point name", text: $name, axis: .vertical)
                TextField("Coordinates", text: $coordinates, axis: .vertical)
            } footer: {
                Text("You can add coordinates manually or select point on the map")
            }
            .listRowBackground(Color.component)
            Section {
                NavigationLink {
                    PointCreationMapView(coordinates: $coordinates)
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
                    if viewModel.validateCoordinates(coordinates) {
                        viewModel.addNewPoint(
                            name: name,
                            coordinatesString: coordinates
                        )
                        dismiss()
                    } else {
                        showInvalidCoordinatesAlert.toggle()
                    }
                }
            }
        }
        .alert("Invalid coordinates", isPresented: $showInvalidCoordinatesAlert) {}
    }
}

#Preview {
    NavigationView {
        PointCreationView()
            .environmentObject(CargoCreationViewModel())
    }
}
