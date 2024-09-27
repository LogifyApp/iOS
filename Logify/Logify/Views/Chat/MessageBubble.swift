//
//  MessageBubble.swift
//  Logify
//
//  Created by Vlad Klunduk on 14/09/2024.
//

import SwiftUI

struct MessageBubble: View {
    
    var message: Message
    var isSender: Bool
    
    var body: some View {
        VStack(alignment: isSender ? .trailing : .leading, spacing: 0) {
            Text(message.content)
                .padding()
                .foregroundStyle(Color.black)
                .background(
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundStyle(isSender ? .message : .white))
                .frame(maxWidth: 300,
                       alignment: isSender ? .trailing : .leading)
            Text("\(message.date.formatted(.dateTime.hour().minute()))")
                .padding(isSender ? .trailing : .leading, 6)
                .font(.system(size: 14))
        }
        .frame(maxWidth: .infinity,
               alignment: isSender ? .trailing : .leading)
        .padding(.horizontal, 10)
    }
}

#Preview {
    MessageBubble(message: Message(id: 1, content: "Test", date: .now, userId: 1, chatId: 1), isSender: true)
        .background(Color.background)
}
