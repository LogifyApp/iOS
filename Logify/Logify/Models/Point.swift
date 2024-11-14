//
//  Point.swift
//  Logify
//
//  Created by Vlad Klunduk on 01/09/2024.
//

import Foundation

struct Point {
    var id: Int
    var label: String
    var latitude: Double
    var longtitude: Double
    var order: Int
    var cargoId: Int
}

extension Point {
    func getCoordinates() -> String {
        "\(latitude) \(longtitude)"
    }
}

extension Point: Hashable {
    
}
