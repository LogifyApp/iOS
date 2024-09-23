//
//  DriverChatView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import SwiftUI

struct DriverChatView: View {
    
    @State private var text = ""
    @Environment(\.dismiss) var dismiss
    @FocusState private var isFieldFocused: Bool
    @Binding var sender: User
    @Binding var recipient: User
    @Binding var messages: [Message]
    
    var body: some View {
        NavigationView {
            VStack {
                if messages.isEmpty {
                    Text("Chat history is empty")
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .background(Color.background)
                        .font(.system(size: 16))
                } else {
                    ScrollView {
                        VStack {
                            ForEach(messages, id: \.id) { message in
                                MessageBubble(message: message,
                                              isSender: message.userId == sender.id)
                            }
                        }
                    }
                    .background(Color.background)
                    .defaultScrollAnchor(.bottom)
                }
                MessageField(isFocused: $isFieldFocused,
                             text: $text) {
                    saveMessage()
                    text = ""
                }
            }
            .navigationTitle("\(recipient.name) \(recipient.surname)")
            .navigationBarTitleDisplayMode(.inline)
            .onTapGesture {
                isFieldFocused = false
            }
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
    
    func saveMessage() {
        messages.append(Message(id: text.count, content: text, date: .now, userId: sender.id, chatId: 1))
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
