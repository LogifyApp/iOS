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
    @State private var pointWasTapped = false
    @Binding var isTabViewPresented: Bool
    
    var body: some View {
        List {
            //MARK: Info
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
                    property: "Driver ID",
                    value: "\(cargoViewModel.cargo.driverId)"
                )
                ListDetailRow(
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
                    ForEach(cargoViewModel.points, id: \.id) { point in
                        PointRow(
                            point: point,
                            isLast: cargoViewModel.points.last?.id == point.id
                        )
                        .onTapGesture {
                            UIPasteboard.general.string = point.getCoordinates()
                            withAnimation(.snappy) {
                                pointWasTapped = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation(.snappy) {
                                    pointWasTapped = false
                                }
                            }
                        }
                    }
                }
                Button(action: { isMapPresented.toggle() }) {
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
                 .fullScreenCover(isPresented: $isMapPresented) {
                     MapView(viewModel:
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
                description = cargoViewModel.cargo.description
                isTabViewPresented = false
            }
        }
        .overlay {
            if pointWasTapped {
                ActionNotificationView(text: "Coordinates were copied")
            }
        }
    }
}

#Preview {
    NavigationView {
        EmployerCargoDetailsView(
            cargoViewModel: EmployerCargoViewModel(),
            isTabViewPresented: .constant(false)
        )
    }
}
