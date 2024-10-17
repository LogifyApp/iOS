//
//  DriverChatView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import SwiftUI

struct DriverChatView: View {
    
    @ObservedObject var chatViewModel: ChatViewModel
    @FocusState private var isFieldFocused: Bool
    @State private var text = ""
    @Environment(\.dismiss) var dismiss
    var senderId: Int
    
    var body: some View {
        NavigationView {
            VStack {
                if chatViewModel.messages.isEmpty {
                    Text("Chat history is empty")
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .background(Color.background)
                        .font(.system(size: 16))
                } else {
                    ScrollViewReader { proxy in
                        ScrollView {
                            ForEach(chatViewModel.messages, id: \.id) { message in
                                MessageBubble(
                                    message: message,
                                    isSender: message.userId == senderId
                                )
                            }
                        }
                        .background(Color.background)
                        .onChange(of: chatViewModel.messages.last!.id) { _, last in
                            withAnimation {
                                proxy.scrollTo(last, anchor: .bottom)
                            }
                        }
                    }
                }
                MessageField(isFocused: $isFieldFocused, text: $text) {
                    chatViewModel.sendMessage(with: text, from: senderId)
                    text = ""
                }
            }
            .navigationTitle(senderId == chatViewModel.driver.id ? chatViewModel.employer.getFullName() : chatViewModel.driver.getFullName())
            .navigationBarTitleDisplayMode(.inline)
            .onTapGesture {
                isFieldFocused = false
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "phone") {
                        UIApplication.shared.open(
                            URL(string: "tel:\(senderId == chatViewModel.driver.id ? chatViewModel.employer.phoneNumber : chatViewModel.driver.phoneNumber)")!)
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
            chatViewModel: ChatViewModel(
                driver: Driver(id: 1, name: "Name", surname: "Surname", phoneNumber: 123, password: "", role: "", status: "Available"),
                employer: Employer(id: 2, name: "Name2", surname: "Surname2", phoneNumber: 123, password: "", role: "")
            ), senderId: 1
        )
    }
}
