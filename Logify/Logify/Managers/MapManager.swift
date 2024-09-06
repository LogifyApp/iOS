//
//  MapManager.swift
//  Logify
//
//  Created by Vlad Klunduk on 04/09/2024.
//

import Foundation
import MapKit

class MapManager {
    
    static var shared = MapManager()
    
    private init() {}
    
    func convertToCoordinates(_ points: [Point]) -> [CLLocationCoordinate2D] {
        var coordinates: [CLLocationCoordinate2D] = []
        coordinates = points.map({ point in
            CLLocationCoordinate2D(latitude: point.latitude, longitude: point.longtitude)
        })
        return coordinates
    }
}
