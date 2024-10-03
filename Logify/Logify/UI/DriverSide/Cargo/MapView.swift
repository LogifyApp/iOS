//
//  MapView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/09/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @StateObject var mapViewModel: MapViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            Map {
                Annotation("Warehouse", coordinate: mapViewModel.coordinates[0]) {
                    Image(systemName: "shippingbox.fill")
                        .padding(4)
                        .foregroundStyle(.white)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 7))
                }
                ForEach(1..<mapViewModel.coordinates.count) { index in
                    Marker(mapViewModel.points[index].label, coordinate: mapViewModel.coordinates[index])
                }
                ForEach(mapViewModel.routes, id: \.self) { route in
                    MapPolyline(route.polyline)
                        .stroke(.blue, lineWidth: 5)
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button("Return") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    MapView(mapViewModel:
                MapViewModel(
                    points: [
                        Point(id: 0, label: "start", latitude: 52.219420, longtitude: 20.983114, order: 0, cargoId: 1),
                        Point(id: 0, label: "mokotow", latitude: 52.240238, longtitude: 21.018649, order: 0, cargoId: 1),
                        Point(id: 0, label: "wola", latitude: 52.260238, longtitude: 21.038649, order: 0, cargoId: 1),
                        Point(id: 0, label: "bemovo", latitude: 52.220238, longtitude: 20.95649, order: 0, cargoId: 1)
                    ]
                )
        )
}
