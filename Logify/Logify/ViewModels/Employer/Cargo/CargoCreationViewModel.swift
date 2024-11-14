//
//  NewCargoViewModel.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import Foundation
class CargoCreationViewModel: ObservableObject {
    var cargo: Cargo
    @Published var driver: Driver?
    @Published var car: Car?
    @Published var points: [Point] = []
    @Published var drivers: [Driver] = []
    @Published var cars: [Car] = []
    
    init() {
        self.cargo = Cargo(id: 0, description: "", status: "", creationDate: .now, employerId: 0, driverId: 0, carId: "")
        fetchDriversList()
        getCarsList()
    }
    
    func fetchDriversList() {
        drivers = [
            Driver(id: 1, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "", status: "Available"),
            Driver(id: 2, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "", status: "Available"),
            Driver(id: 3, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "", status: "Available"),
            Driver(id: 4, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "", status: "Available")
        
        ]
    }
    
    func getCarsList()  {
        cars = [
            Car(plate: "PP6745C", brand: "Ford", model: "Focus", status: 0, isDeleted: 0, employerId: 1),
            Car(plate: "HD4236A", brand: "Toyota", model: "Prius", status: 0, isDeleted: 0, employerId: 1),
            Car(plate: "KI3597K", brand: "VW", model: "Golf", status: 0, isDeleted: 0, employerId: 1),
            Car(plate: "PO8972M", brand: "Renault", model: "Arkana", status: 0, isDeleted: 0, employerId: 1)
        ]
        points = [
            Point(id: 1, label: "Point 1", latitude: 52.219420, longtitude: 20.983114, order: 0, cargoId: 1),
            Point(id: 2, label: "Point 2", latitude: 52.219420, longtitude: 20.983114, order: 0, cargoId: 1),
            Point(id: 3, label: "Point 3", latitude: 52.219420, longtitude: 20.983114, order: 0, cargoId: 1)
        ]
    }
    
    func addNewPoint(name: String, coordinatesString: String) {
        let coordinates = coordinatesString.components(separatedBy: " ")
        let latitude = Double(coordinates.first!)!
        let longtitude = Double(coordinates.last!)!
        points.append(
            Point(
                id: Int.random(in: 0...1000),
                label: name,
                latitude: latitude,
                longtitude: longtitude,
                order: 1,
                cargoId: 1
            )
        )
    }
    
    func getNewPoint(name: String, coordinatesString: String) -> Point {
        let coordinates = coordinatesString.components(separatedBy: " ")
        let latitude = Double(coordinates.first!)!
        let longtitude = Double(coordinates.last!)!
        return Point(
            id: Int.random(in: 0...1000),
            label: name,
            latitude: latitude,
            longtitude: longtitude,
            order: 1,
            cargoId: cargo.id
        )
    }
    
    func validateCoordinates(_ coordinates: String) -> Bool {
        let array = coordinates.components(separatedBy: " ")
        if array.count == 2, let latitude = array.first,
            let longtitude = array.last {
            return true
        }
        return false
    }
    
    func removePoint(_ point: Point) {
        points.removeAll { $0.id == point.id }
    }
}
