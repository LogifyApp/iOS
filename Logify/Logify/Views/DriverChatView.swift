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
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack {
                        MessageBubble(message: Message(id: 1, content: "test test test test", date: .now, userId: 1, chatId: 1), isSender: true)
                        MessageBubble(message: Message(id: 1, content: "Test test test test test test test test test test test test test", date: .now, userId: 1, chatId: 1), isSender: false)
                        MessageBubble(message: Message(id: 1, content: "Test", date: .now, userId: 1, chatId: 1), isSender: false)
                        MessageBubble(message: Message(id: 1, content: "test test test test test test test test test test test test test test test test test test test test test test test test test test test testtest test test test", date: .now, userId: 1, chatId: 1), isSender: true)
                    }
                    .frame(maxHeight: .infinity)
                }
                .defaultScrollAnchor(.bottom)
                .onTapGesture {
                    isFieldFocused = false
                }
                .background(Color.background)
                MessageField(isFocused: $isFieldFocused)
            }
            .navigationTitle("Test Testtest")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "phone.fill")
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
        DriverChatView()
    }
}
