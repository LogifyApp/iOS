//
//  MapView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/09/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var routes: [MKRoute] = []
    var points: [Point]
    var coordinates: [CLLocationCoordinate2D] {
        MapManager.shared.convertToCoordinates(points)
    }
    
    var body: some View {
        NavigationView{
            Map {
                Annotation("Warehouse", coordinate: coordinates[0]) {
                    Image(systemName: "shippingbox.fill")
                        .padding(4)
                        .foregroundStyle(.white)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 7))
                }
                ForEach(1..<coordinates.count) { index in
                    Marker(points[index].label, coordinate: coordinates[index])
                }
                ForEach(routes, id: \.self) { route in
                    MapPolyline(route.polyline)
                        .stroke(.blue, lineWidth: 5)
                }
            }
            .onAppear {
                (0..<coordinates.count-1).forEach({ index in
                    fetchRoute(coordinates[index], coordinates[index+1])
                })
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
    MapView(points: [
        Point(id: 0, label: "start", latitude: 52.219420, longtitude: 20.983114, order: 0),
        Point(id: 0, label: "mokotow", latitude: 52.240238, longtitude: 21.018649, order: 0),
        Point(id: 0, label: "wola", latitude: 52.260238, longtitude: 21.038649, order: 0),
        Point(id: 0, label: "bemovo", latitude: 52.220238, longtitude: 20.95649, order: 0)
    ])
}


extension MapView {
    func fetchRoute(_ source: CLLocationCoordinate2D, 
                    _ destination: CLLocationCoordinate2D) {
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: .init(coordinate: source))
        request.destination = MKMapItem(placemark: .init(coordinate: destination))
        
        Task {
            guard let result = try? await MKDirections(request: request).calculate() else { return }
            routes.append(result.routes.first!)
        }
    }
}
