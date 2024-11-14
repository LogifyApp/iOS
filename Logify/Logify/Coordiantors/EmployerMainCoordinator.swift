//
//  EmployerMainCoordinator.swift
//  Logify
//
//  Created by Vlad Klunduk on 09/11/2024.
//

import Foundation

enum Tab {
    case cargo, delivery, chat, profile
}

class EmployerMainCoordinator: ObservableObject {
    
    @Published var selectedTab = Tab.cargo
    
    init() {
    }
}
