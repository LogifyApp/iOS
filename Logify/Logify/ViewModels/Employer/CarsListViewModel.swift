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
            Car(plate: "AA1111", brand: "Volvo", model: "xc 90", status: 1, isDeleted: 1, employerId: 1),
            Car(plate: "AA1112", status: 1, isDeleted: 1, employerId: 1),
            Car(plate: "AA1113", brand: "VW", model: "Golf", status: 1, isDeleted: 1, employerId: 1),
            Car(plate: "AA1114", status: 1, isDeleted: 1, employerId: 1)
        ]
    }
}
