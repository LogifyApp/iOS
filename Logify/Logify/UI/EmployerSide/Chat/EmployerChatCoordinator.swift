//
//  EmployerChatCoordinator.swift
//  Logify
//
//  Created by Vlad Klunduk on 09/11/2024.
//

import SwiftUI

enum ChatPage: Hashable {
    case list
    case details(of: Chat)
}

class EmployerChatCoordinator: ObservableObject {
    @Published var path: NavigationPath
    
    init() {
        path = NavigationPath()
    }
    
    @ViewBuilder
    func build(_ page: ChatPage) -> some View {
        switch page {
        case .list:
            EmployerChatsListView(
                viewModel: EmployerChatsListViewModel(coordinator: self),
                isTabViewPresented: .constant(true)
            )
        case .details(let chat):
            EmployerChatView(
                chatViewModel: ChatViewModel(chat: chat),
                isTabViewPresented: .constant(true), senderId: 1
            )
        }
    }
    
    func push(_ page: ChatPage) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
}
