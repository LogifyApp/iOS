//
//  EmployerChatsListViewModel.swift
//  Logify
//
//  Created by Vlad Klunduk on 14/10/2024.
//

import Foundation
class EmployerChatsListViewModel: ObservableObject {
    @Published var drivers: [Driver] = []
    @Published var chats: [Chat] = []
    @Published var coordinator: EmployerChatCoordinator!
    
    init() {
        drivers = [
            Driver(id: 1, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "", status: "Available"),
            Driver(id: 2, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "", status: "Available"),
            Driver(id: 3, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "", status: "Available"),
            Driver(id: 4, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "", status: "Available"),
            Driver(id: 5, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "", status: "Available")
        ]
        chats = [
            Chat(id: 1, startDate: .now, employerId: 1, driverId: 1),
            Chat(id: 2, startDate: .now, employerId: 1, driverId: 2),
            Chat(id: 3, startDate: .now, employerId: 1, driverId: 3),
            Chat(id: 4, startDate: .now, employerId: 1, driverId: 4),
            Chat(id: 5, startDate: .now, employerId: 1, driverId: 5),
            Chat(id: 6, startDate: .now, employerId: 1, driverId: 1),
            Chat(id: 7, startDate: .now, employerId: 1, driverId: 2),
            Chat(id: 8, startDate: .now, employerId: 1, driverId: 3),
            Chat(id: 9, startDate: .now, employerId: 1, driverId: 4),
            Chat(id: 10, startDate: .now, employerId: 1, driverId: 5)
        ]
    }
    
    init(coordinator: EmployerChatCoordinator) {
        self.coordinator = coordinator
        drivers = [
            Driver(id: 1, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "", status: "Available"),
            Driver(id: 2, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "", status: "Available"),
            Driver(id: 3, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "", status: "Available"),
            Driver(id: 4, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "", status: "Available"),
            Driver(id: 5, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "", status: "Available")
        ]
        chats = [
            Chat(id: 1, startDate: .now, employerId: 1, driverId: 1),
            Chat(id: 2, startDate: .now, employerId: 1, driverId: 2),
            Chat(id: 3, startDate: .now, employerId: 1, driverId: 3),
            Chat(id: 4, startDate: .now, employerId: 1, driverId: 4),
            Chat(id: 5, startDate: .now, employerId: 1, driverId: 5),
            Chat(id: 6, startDate: .now, employerId: 1, driverId: 1),
            Chat(id: 7, startDate: .now, employerId: 1, driverId: 2),
            Chat(id: 8, startDate: .now, employerId: 1, driverId: 3),
            Chat(id: 9, startDate: .now, employerId: 1, driverId: 4),
            Chat(id: 10, startDate: .now, employerId: 1, driverId: 5)
        ]
    }
    
    func getDriver(chatId: Int) -> Driver {
        return Driver(id: 1, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "", status: "Available")
    }
    
    func getLastMessage(chatId: Int) -> Message {
        return Message(id: 1, content: "Hi! I'm on my way.", date: .now, userId: 1, chatId: 0)
    }
    
    func push(_ page: ChatPage) {
        coordinator.push(page)
    }
}
