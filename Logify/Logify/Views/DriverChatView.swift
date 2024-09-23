//
//  DriverChatView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import SwiftUI

struct DriverChatView: View {
    
    @Environment(\.dismiss) var dismiss
    @FocusState private var isFieldFocused: Bool
    @Binding var sender: User
    @Binding var recipient: User
    @Binding var messages: [Message]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack {
                        ForEach(messages, id: \.id) { message in
                            MessageBubble(message: message,
                                          isSender: message.userId == sender.id)
                        }
                        
                    }
                    .background(Color.red)
                }
                .defaultScrollAnchor(.bottom)
                .background(Color.background)
                .onTapGesture {
                    isFieldFocused = false
                }
                MessageField(isFocused: $isFieldFocused)
            }
            .navigationTitle("\(recipient.name) \(recipient.surname)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        UIApplication.shared.open(URL(string: "\(recipient.phoneNumber)")!)
                    }) {
                        Image(systemName: "phone")
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { dismiss() }) {
                        Text("Back")
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        DriverChatView(
            sender: .constant(User(id: 1, name: "Test1", surname: "Testtest1", phoneNumber: 234, password: "", role: "driver")),
            recipient: .constant(User(id: 2, name: "Test2", surname: "Testtest2", phoneNumber: 234, password: "", role: "employer")),
            messages: .constant([
                Message(id: 1, content: "test test test test", date: .now, userId: 1, chatId: 1),
                Message(id: 2, content: "test test test test", date: .now, userId: 2, chatId: 1),
                Message(id: 3, content: "test test test test", date: .now, userId: 1, chatId: 1),
                Message(id: 4, content: "test test test test", date: .now, userId: 2, chatId: 1)
            ])
        )
    }
}
