//
//  CarsListViewModel.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/11/2024.
//

import Foundation
class CarsListViewModel: ObservableObject {
    @Published var cars: [Car]
    
    init(cars: [Car]) {
        self.cars = cars
    }
    
    init() {
        cars = [
            Car(plate: "AA1111", status: 1, isDeleted: 1, employerId: 1),
            Car(plate: "AA1111", status: 1, isDeleted: 1, employerId: 1),
            Car(plate: "AA1111", status: 1, isDeleted: 1, employerId: 1),
            Car(plate: "AA1111", status: 1, isDeleted: 1, employerId: 1)
        ]
    }
}
