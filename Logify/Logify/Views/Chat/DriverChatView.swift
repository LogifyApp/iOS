//
//  DriverChatView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import SwiftUI

struct DriverChatView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var chatManager: ChatManager
    @FocusState private var isFieldFocused: Bool
    @State private var text = ""
    var senderId: Int
    
    var body: some View {
        NavigationView {
            VStack {
                if chatManager.messages.isEmpty {
                    Text("Chat history is empty")
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .background(Color.background)
                        .font(.system(size: 16))
                } else {
                    ScrollViewReader { proxy in
                        ScrollView {
                            ForEach(chatManager.messages, id: \.id) { message in
                                MessageBubble(
                                    message: message,
                                    isSender: message.userId == senderId
                                )
                            }
                        }
                        .background(Color.background)
                        .onChange(of: chatManager.messages.last!.id) { _, last in
                            withAnimation {
                                proxy.scrollTo(last, anchor: .bottom)
                            }
                        }
                    }
                }
                MessageField(isFocused: $isFieldFocused, text: $text) {
                    chatManager.sendMessage(with: text, from: senderId)
                    text = ""
                }
            }
            .navigationTitle(senderId == chatManager.driver.id ? chatManager.employer.getFullName() : chatManager.driver.getFullName())
            .navigationBarTitleDisplayMode(.inline)
            .onTapGesture {
                isFieldFocused = false
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "phone") {
                        UIApplication.shared.open(
                            URL(string: "tel:\(senderId == chatManager.driver.id ? chatManager.employer.phoneNumber : chatManager.driver.phoneNumber)")!)
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
            chatManager: ChatManager(
                driver: Driver(id: 1, name: "Name", surname: "Surname", phoneNumber: 123, password: "", role: ""),
                employer: Employer(id: 2, name: "Name2", surname: "Surname2", phoneNumber: 123, password: "", role: "")
            ), senderId: 1
        )
    }
}
