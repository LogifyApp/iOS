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
    @Published var cargoCoordinator: EmployerCargoCoordinator!
    @Published var deliveryCoordinator: EmployerDeliveryCoordinator!
    @Published var chatCoordinator: EmployerChatCoordinator!
    @Published var profileCoordinator: EmployerProfileCoordinator!
    
    @Published var selectedTab = Tab.cargo
    
    init() {
        chatCoordinator = .init()
    }
}
