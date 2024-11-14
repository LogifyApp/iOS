//
//  ChatsListView.swift
//  Logify
//
//  Created by Vlad Klunduk on 14/10/2024.
//

import SwiftUI

struct EmployerChatsListView: View {
    @ObservedObject var viewModel: EmployerChatsListViewModel
    @State private var searchBarText = ""
    @Binding var isTabViewPresented: Bool
    
    var body: some View {
            ScrollView {
                ForEach(viewModel.chats, id: \.id) { chat in
                    Button {
                        viewModel.push(.details(of: Chat(id: 1, startDate: .now, employerId: 1, driverId: 1)))
                    } label: {
                        ChatDetailsRow(
                            driver: viewModel.getDriver(chatId: chat.id),
                            lastMessage: viewModel.getLastMessage(chatId: chat.id)
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .navigationTitle("Chats")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.background)
            .toolbarBackground(.thinMaterial, for: .navigationBar)
            .toolbarBackground(.hidden, for: .tabBar)
            .toolbar(isTabViewPresented ? .visible : .hidden, for: .tabBar)
            .searchable(
                text: $searchBarText,
                placement: .navigationBarDrawer(displayMode: .automatic)
            )
            .onAppear {
                withAnimation {
                    isTabViewPresented = true
                }
            }
        
    }
}

#Preview {
    EmployerChatsListView(
        viewModel: EmployerChatsListViewModel(),
        isTabViewPresented: .constant(true)
    )
}
