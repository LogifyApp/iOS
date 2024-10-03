//
//  CargoViewModel.swift
//  Logify
//
//  Created by Vlad Klunduk on 02/10/2024.
//

import Foundation

class CargoViewModel: ObservableObject {
    @Published var cargo: Cargo
    @Published var documents: Set<URL> = []
    
    init() {
        cargo = Cargo(id: 137287897,
                              description: "Descriptioin",
                              status: "Created",
                              creationDate: Date.now,
                              carId: "24987",
                              points: [
                                 Point(id: 0, label: "start", latitude: 52.219420, longtitude: 20.983114, order: 0),
                                 Point(id: 1, label: "mokotow", latitude: 52.240238, longtitude: 21.018649, order: 0),
                                 Point(id: 2, label: "wola", latitude: 52.260238, longtitude: 21.038649, order: 0),
                                 Point(id: 3, label: "bemovo", latitude: 52.220238, longtitude: 20.95649, order: 0)
                              ])
    }
    
    init(_ cargo: Cargo) {
        self.cargo = cargo
    }
    
    func fetchDocuments() {
        
    }
    
    func addDocument(with url: URL) {
        documents.insert(url)
        
    }
    
    func removeDocument(with url: URL) {
        documents.remove(url)
        
    }
}
