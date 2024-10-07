//
//  EmployerCargoDetailsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct EmployerCargoDetailsView: View {
    @ObservedObject var cargoViewModel: EmployerCargoViewModel
    @State private var isMapPresented = false
    @State private var description = ""
    @State private var disableEditing = true
    
    var body: some View {
        List {
            //MARK: Info
            Section {
                CargoDetailsCell(
                    property: "Cargo ID",
                    value: "\(cargoViewModel.cargo.id)"
                )
                CargoDetailsCell(
                    property: "Status",
                    value: cargoViewModel.cargo.status
                )
                CargoDetailsCell(
                    property: "Creation date",
                    value: cargoViewModel.cargo.getCreationDateString()
                )
                CargoDetailsCell(
                    property: "Car ID",
                    value: cargoViewModel.cargo.carId
                )
                NavigationLink {
                    EmployerCargoDocumentsView(cargoViewModel: cargoViewModel)
                } label: {
                    Text("Documents")
                        .foregroundStyle(.secondary)
                }
            }
            //MARK: Description
            Section {
                TextField("", text: $description)
                    .disabled(disableEditing)
            } header: {
                HStack {
                    Spacer()
                    Button("Edit") {
                        
                    }
                    .textCase(.none)
                }
            }
            //MARK: Route
            Section {
                VStack {
                    ForEach(cargoViewModel.points, id: \.id) { point in
                        PointRow(
                            point: point,
                            isLast: cargoViewModel.points.last?.id == point.id
                        )
                    }
                }
                Button(action: { isMapPresented.toggle() }) {
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
        .background(Color.background)
        .navigationTitle("Details")
        .toolbarTitleDisplayMode(.inline)
        .scrollContentBackground(.hidden)
        .onAppear {
            description = cargoViewModel.cargo.description
        }
    }
}

#Preview {
    NavigationView {
        EmployerCargoDetailsView(cargoViewModel: EmployerCargoViewModel())
    }
}
