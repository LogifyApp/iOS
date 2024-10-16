//
//  EmployerChatView.swift
//  Logify
//
//  Created by Vlad Klunduk on 16/10/2024.
//

import SwiftUI

struct EmployerChatView: View {
    @ObservedObject var chatViewModel: ChatViewModel
    @FocusState private var isFieldFocused: Bool
    @State private var text = ""
    @Binding var isTabViewPresented: Bool
    var senderId: Int
    
    var body: some View {
        VStack(spacing: 0) {
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
            if !isTabViewPresented {
                MessageField(isFocused: $isFieldFocused, text: $text) {
                    chatViewModel.sendMessage(with: text, from: senderId)
                    text = ""
                }
                .padding(.top, 8)
                .background(.thickMaterial)
            }
        }
        .navigationTitle(senderId == chatViewModel.driver.id ? chatViewModel.employer.getFullName() : chatViewModel.driver.getFullName())
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.thickMaterial, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("", systemImage: "phone") {
                    UIApplication.shared.open(
                        URL(string: "tel:\(senderId == chatViewModel.driver.id ? chatViewModel.employer.phoneNumber : chatViewModel.driver.phoneNumber)")!)
                }
            }
        }
        .onTapGesture {
            isFieldFocused = false
        }
        .onAppear {
            withAnimation {
                isTabViewPresented = false
            }
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    NavigationView {
        EmployerChatView(
            chatViewModel: ChatViewModel(
                driver: Driver(id: 1, name: "Name", surname: "Surname", phoneNumber: 123, password: "", role: "", status: "Available"),
                employer: Employer(id: 2, name: "Name2", surname: "Surname2", phoneNumber: 123, password: "", role: "")
            ),
            isTabViewPresented: .constant(true), 
            senderId: 1
        )
    }
}
