//
//  ChatRow.swift
//  Logify
//
//  Created by Vlad Klunduk on 14/10/2024.
//

import SwiftUI

struct ChatDetailsRow: View {
    var driver: Driver
    var lastMessage: Message
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("Name Surname")
                    .fontWeight(.semibold)
                Text(lastMessage.userId == driver.id ? driver.getFullName() : "You")
                Text("This message was sent by driver oernofr fenrofiner eriofnrif")
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }
            
            Spacer()
            Text("23:23")
                
        }
    }
}

#Preview {
    ChatDetailsRow(
        driver: Driver(id: 1, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "", status: "Available"),
        lastMessage: Message(id: 1, content: "Hi! I'm on my way.", date: .now, userId: 1, chatId: 0)
    )
}
