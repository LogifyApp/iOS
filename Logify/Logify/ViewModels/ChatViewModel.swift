//
//  ChatViewModel.swift
//  Logify
//
//  Created by Vlad Klunduk on 02/10/2024.
//

import Foundation

class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []
    var driver: Driver
    var employer: Employer
    var chat: Chat!
        
    init(driver: Driver, employer: Employer) {
        self.driver = driver
        self.employer = employer
        
        fetchChatMessages()
    }
    
    func fetchChat(employerId: Int, driverId: Int) {
        
    }
    
    func fetchChatMessages() {
        messages = [
            Message(id: employer.id, content: "Hi!", date: .now, userId: 2, chatId: 0),
            Message(id: driver.id, content: "Hi! I'm on my way.", date: .now, userId: 1, chatId: 0)
        ]
    }
    
    func sendMessage(with content: String, from userId: Int) {
        messages.append(Message(id: Int.random(in: 0...130984), content: content, date: .now, userId: userId, chatId: 0))
    }
}
