//
//  DriverManager.swift
//  Logify
//
//  Created by Vlad Klunduk on 27/07/2024.
//

import Foundation

class DriverManager: ObservableObject {
    @Published var driver: Driver
    
    init(driver: Driver) {
        self.driver = driver
    }

    init() {
        self.driver = Driver(id: 0)
    }
}
