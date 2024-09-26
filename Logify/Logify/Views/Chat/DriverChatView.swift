//
//  DriverChatView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import SwiftUI

struct DriverChatView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var chatManager: ChatManager = ChatManager()
    @FocusState private var isFieldFocused: Bool
    @State private var text = ""
    var recipient: User
    var sender: User
    
    var body: some View {
        NavigationView {
            VStack {
                if chatManager.messages.isEmpty {
                    Text("Chat history is empty")
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .background(Color.background)
                        .font(.system(size: 16))
                } else {
                    ScrollView {
                        VStack {
                            ForEach(chatManager.messages, id: \.id) { message in
                                MessageBubble(message: message,
                                              isSender: message.userId == sender.id)
                            }
                        }
                    }
                    .background(Color.background)
                    .defaultScrollAnchor(.bottom)
                }
                MessageField(isFocused: $isFieldFocused, text: $text) {
                    chatManager.sendMessage(with: text)
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
                        UIApplication.shared.open(URL(string: "tel:\(recipient.phoneNumber)")!)
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
        .onAppear {
            chatManager.fetchChat(employerId: recipient.id, driverId: sender.id)
        }
    }
}

#Preview {
    NavigationView {
        DriverChatView(
            recipient: Employer(id: 2, name: "Name2", surname: "Surname2", phoneNumber: 123, password: "", role: ""),
            sender: Driver(id: 1, name: "Name", surname: "Surname", phoneNumber: 123, password: "", role: "")
        )
    }
}
