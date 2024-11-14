//
//  EmployerCargoDetailsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct EmployerCargoDetailsView: View {
    @ObservedObject var viewModel: EmployerCargoViewModel
    @State private var isMapPresented = false
    @State private var description = ""
    @State private var disableEditing = true
    @State private var pointWasTapped = false
    @Binding var isTabViewPresented: Bool
    
    var body: some View {
        List {
            //MARK: Info
            Section {
                ListDetailRow(
                    property: "Cargo ID",
                    value: "\(viewModel.cargo.id)"
                )
                ListDetailRow(
                    property: "Status",
                    value: viewModel.cargo.status
                )
                ListDetailRow(
                    property: "Creation date",
                    value: viewModel.cargo.getCreationDateString()
                )
                ListDetailRow(
                    property: "Driver ID",
                    value: "\(viewModel.cargo.driverId)"
                )
                ListDetailRow(
                    property: "Car ID",
                    value: viewModel.cargo.carId
                )
                NavigationLink {
                    EmployerCargoDocumentsView(cargoViewModel: viewModel)
                } label: {
                    Text("Documents")
                        .foregroundStyle(.secondary)
                }
            }
            //MARK: Description
            Section {
                TextField("", text: $description, axis: .vertical)
                        .disabled(disableEditing)
                Button(disableEditing ? "Edit" : "Done") {
                    //save description
                    disableEditing.toggle()
                }
            }
            //MARK: Route
            Section {
                VStack {
                    ForEach(viewModel.points, id: \.id) { point in
                        PointRow(
                            point: point,
                            isLast: viewModel.points.last?.id == point.id
                        )
                        .onTapGesture {
                            UIPasteboard.general.string = point.getCoordinates()
                            withAnimation {
                                pointWasTapped = true
                            }
                        }
                    }
                }
                Button {
                    viewModel.showMap()
                } label: {
                     HStack {
                         Image(systemName: "map")
                         Text("Map")
                     }
                     .frame(width: 320, height: 38)
                     .modifier(
                         ButtonStyleModifier(
                            background: .black,
                            foreground: .white
                         )
                     )
                 }
                 .padding(.bottom, 4)
            } footer: {
                Text("You can copy point coordinates by tapping on it")
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
                description = viewModel.cargo.description
                isTabViewPresented = false
            }
        }
        .hud($pointWasTapped, "Coordinates were copied")
    }
}

#Preview {
    NavigationView {
        EmployerCargoDetailsView(
            viewModel: EmployerCargoViewModel(coordinator: EmployerCargoCoordinator()),
            isTabViewPresented: .constant(false)
        )
    }
}
