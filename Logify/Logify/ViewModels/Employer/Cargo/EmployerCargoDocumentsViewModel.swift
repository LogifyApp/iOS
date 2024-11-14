//
//  EmployerCargoDocumentsViewModel.swift
//  Logify
//
//  Created by Vlad Klunduk on 15/11/2024.
//

import Foundation

class EmployerCargoDocumentsViewModel: ObservableObject {
    @Published var documents: Set<URL> = [URL(filePath: "sdf")]
    var coordinator: EmployerCargoCoordinator
    var cargoId: Int
    
    init(coordinator: EmployerCargoCoordinator, cargoId: Int) {
        self.coordinator = coordinator
        self.cargoId = cargoId
    }
    
    func fetchDocuments() {
        
    }
    
    func removeDocument(with url: URL) {
        documents.remove(url)
        
    }
    
    func approveDocuments() {
        
    }
}
