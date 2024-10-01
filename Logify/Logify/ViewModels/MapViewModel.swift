//
//  MapViewModel.swift
//  Logify
//
//  Created by Vlad Klunduk on 02/10/2024.
//

import Foundation
import MapKit

class MapViewModel: ObservableObject {
    @Published var routes: [MKRoute] = []
    var points: [Point] = []
    var coordinates: [CLLocationCoordinate2D] {
        convertToCoordinates(points)
    }
    
    init(points: [Point]) {
        self.points = points
        fetchAllRoutes()
    }
    
    func convertToCoordinates(_ points: [Point]) -> [CLLocationCoordinate2D] {
        var coordinates: [CLLocationCoordinate2D] = []
        coordinates = points.map({ point in
            CLLocationCoordinate2D(latitude: point.latitude, longitude: point.longtitude)
        })
        return coordinates
    }
    
    func fetchAllRoutes() {
        for i in (0..<coordinates.count-1) {
            fetchRoute(coordinates[i], coordinates[i+1])
        }
    }
    
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
