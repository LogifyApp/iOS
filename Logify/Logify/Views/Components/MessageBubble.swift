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
            Text("Hello, World! eormoeir wkjci cius dcisu dci sidhc ishd cishf fivsj sijf vish fh sifv")
                .foregroundStyle(Color.white)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundStyle(isSender ? .systemBlue : .black))
                .frame(maxWidth: 300)
            Text("\(message.date.formatted(.dateTime.hour().minute()))")
                .padding(isSender ? .trailing : .leading)
                //.foregroundStyle(Color.white)
        }
        .frame(maxWidth: .infinity,
               alignment: isSender ? .trailing : .leading)
        .padding(.horizontal)
    }
}

#Preview {
    MessageBubble(message: Message(id: 1, content: "HI", date: .now, userId: 1, chatId: 1), isSender: true)
        .background(Color.background)
}
