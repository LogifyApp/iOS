//
//  CargoDetailsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 22/08/2024.
//

import SwiftUI

struct CargoDetailsView: View {
    @ObservedObject var viewModel: CargoViewModel
    @State private var isMapPresented = false
    @State private var pointWasTapped = false
    @Binding var isTabViewPresented: Bool
    
    var body: some View {
        List {
            // MARK: Details
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
                    property: "Car ID",
                    value: viewModel.cargo.carId
                )
                NavigationLink {
                    CargoDocumentsView(viewModel: viewModel)
                } label: {
                    Text("Documents")
                        .foregroundStyle(.secondary)
                }
            }
            // MARK: Description
            Section {
                Text(viewModel.cargo.description)
            }
            // MARK: Route
            Section {
                VStack {
                    ForEach(viewModel.points, id: \.id) { point in
                        PointRow(
                            point: point,
                            isLast: viewModel.points.last?.id == point.id
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
                .padding(.vertical, 8)
                Button {
                    isMapPresented.toggle()
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
                .fullScreenCover(isPresented: $isMapPresented) {
                    MapView(viewModel:
                        MapViewModel(points: viewModel.points)
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
        .overlay {
            if pointWasTapped {
                ActionNotificationView(text: "Coordinates were copied")
            }
        }
    }
}


#Preview {
    NavigationView {
        CargoDetailsView(
            viewModel: CargoViewModel(),
            isTabViewPresented: .constant(false)
        )
    }
}
