//
//  CargoDetailsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 22/08/2024.
//

import SwiftUI

struct CargoDetailsView: View {
    
    @ObservedObject var cargoViewModel: CargoViewModel
    @State private var isMapPresented = false
    @Binding var isTabViewPresented: Bool
    
    var body: some View {
        List {
            // MARK: Details
            Section {
                ListDetailRow(
                    property: "Cargo ID",
                    value: "\(cargoViewModel.cargo.id)"
                )
                ListDetailRow(
                    property: "Status",
                    value: cargoViewModel.cargo.status
                )
                ListDetailRow(
                    property: "Creation date",
                    value: cargoViewModel.cargo.getCreationDateString()
                )
                ListDetailRow(
                    property: "Car ID",
                    value: cargoViewModel.cargo.carId
                )
                NavigationLink {
                    CargoDocumentsView(cargoViewModel: cargoViewModel)
                } label: {
                    Text("Documents")
                        .foregroundStyle(.secondary)
                }
            }
            // MARK: Description
            Section {
                Text(cargoViewModel.cargo.description)
            }
            // MARK: Route
            Section {
                VStack {
                    ForEach(cargoViewModel.points, id: \.id) { point in
                        PointRow(
                            point: point,
                            isLast: cargoViewModel.points.last?.id == point.id
                        )
                    }
                }
                .padding(.vertical, 8)
                Button {
                    isMapPresented.toggle()
                } label: {
                    HStack {
                        Image(systemName: "map")
                        Text("Map")
                    }
                    .modifier(
                        ButtonStyleModifier(
                            width: 310,
                            height: 38,
                            background: .black,
                            foreground: .white
                        )
                    )
                }
                .fullScreenCover(isPresented: $isMapPresented) {
                    MapView(mapViewModel:
                        MapViewModel(points: cargoViewModel.points)
                    )
                }
                .padding(.bottom, 4)
            }
            .listRowSeparator(.hidden)
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.background)
        .scrollContentBackground(.hidden)
        .toolbarBackground(.thinMaterial, for: .navigationBar)
        .onAppear {
            withAnimation {
                isTabViewPresented = false
            }
        }
    }
}


#Preview {
    NavigationView {
        CargoDetailsView(
            cargoViewModel: CargoViewModel(),
            isTabViewPresented: .constant(false)
        )
    }
}
