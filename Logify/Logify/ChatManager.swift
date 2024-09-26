//
//  ChatManager.swift
//  Logify
//
//  Created by Vlad Klunduk on 26/09/2024.
//

import Foundation

class ChatManager: ObservableObject {
    
    @Published var messages: [Message] = []
    var chat: Chat!
    
    init() {}
    
    init(employerId: Int, driverId: Int) {}
    
    func fetchChat(employerId: Int, driverId: Int) {
        
    }
    
    func fetchChatMessages() -> [Message] {
        return []
    }
    
    func sendMessage(with content: String) {
        
    }
    
}
