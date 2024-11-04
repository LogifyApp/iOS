//
//  NewCarViewModel.swift
//  Logify
//
//  Created by Vlad Klunduk on 04/11/2024.
//

import Foundation
class NewCarViewModel: ObservableObject {
    @Published var plate = ""
    @Published var brand = ""
    @Published var model = ""
    
    
    
    func fetchCarBrands() -> [String] {
        guard let url = Bundle.main.url(forResource: "car_brands", withExtension: "json") else {
            return []
        }
        do {
            let data = try Data(contentsOf: url)
            let list = try JSONDecoder().decode([String].self, from: data)
            return list
        } catch {
            print(error)
        }
        return []
    }
}
