//
//  ChatManager.swift
//  Logify
//
//  Created by Vlad Klunduk on 26/09/2024.
//

import Foundation

class ChatManager: ObservableObject {
    
    @Published var driver: Driver
    @Published var employer: Employer
    @Published var messages: [Message] = []
    var chat: Chat!
        
    init(driver: Driver, employer: Employer) {
        self.driver = driver
        self.employer = employer
        fetchChat(employerId: employer.id, driverId: driver.id)
        fetchChatMessages()
    }
    
    func fetchChat(employerId: Int, driverId: Int) {
        
    }
    
    func fetchChatMessages() -> [Message] {
        return []
    }
    
    func sendMessage(with content: String) {
        
    }
}
