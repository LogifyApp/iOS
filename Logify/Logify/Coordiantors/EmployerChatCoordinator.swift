//
//  EmployerChatCoordinator.swift
//  Logify
//
//  Created by Vlad Klunduk on 09/11/2024.
//

import Foundation

class EmployerChatCoordinator: ObservableObject {
    @Published var chatListViewModel: EmployerChatsListViewModel!
    @Published var chatViewModel: ChatViewModel?
    
    init() {
        chatListViewModel = .init()
    }
    
    func showChat(driver: Driver, employer: Employer) {
        chatViewModel = .init(driver: driver, employer: employer)
    }
    
    func hideChat() {
        chatViewModel = nil
    }
}
