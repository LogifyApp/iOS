//
//  Cargo.swift
//  Logify
//
//  Created by Vlad Klunduk on 01/09/2024.
//

import Foundation

struct Cargo {
    var id: Int
    var description: String
    var status: String
    var creationDate: Date
    var carId: String
    var points: [Point]
    //MARK: add driver and employer
}
