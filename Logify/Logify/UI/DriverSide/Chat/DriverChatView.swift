//
//  DriverChatView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import SwiftUI

struct DriverChatView: View {
    @ObservedObject var viewModel: ChatViewModel
    @FocusState private var isFieldFocused: Bool
    @State private var text = ""
    @Environment(\.dismiss) var dismiss
    var senderId: Int
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                if viewModel.messages.isEmpty {
                    Text("Chat history is empty")
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .background(Color.background)
                        .font(.system(size: 16))
                } else {
                    ScrollViewReader { proxy in
                        ScrollView {
                            ForEach(viewModel.messages, id: \.id) { message in
                                MessageBubble(
                                    message: message,
                                    isSender: message.userId == senderId
                                )
                            }
                        }
                        .background(Color.background)
                        .onChange(of: viewModel.messages.last!.id) { _, last in
                            withAnimation {
                                proxy.scrollTo(last, anchor: .bottom)
                            }
                        }
                    }
                }
                MessageField(isFocused: $isFieldFocused, text: $text) {
                    viewModel.sendMessage(with: text, from: senderId)
                    text = ""
                }
                .padding(.top, 8)
                .background(.thickMaterial)
            }
            .navigationTitle(senderId == viewModel.driver.id ? viewModel.employer.getFullName() : viewModel.driver.getFullName())
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.thickMaterial, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "phone") {
                        UIApplication.shared.open(
                            URL(string: "tel:\(senderId == viewModel.driver.id ? viewModel.employer.phoneNumber : viewModel.driver.phoneNumber)")!)
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { dismiss() }) {
                        Text("Back")
                    }
                }
            }
            .onTapGesture {
                isFieldFocused = false
            }
        }
    }
}

#Preview {
    NavigationView {
        DriverChatView(
            viewModel: ChatViewModel(
                driver: Driver(id: 1, name: "Name", surname: "Surname", phoneNumber: 123, password: "", role: "", status: "Available"),
                employer: Employer(id: 2, name: "Name2", surname: "Surname2", phoneNumber: 123, password: "", role: "")
            ), senderId: 1
        )
    }
}
