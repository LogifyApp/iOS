//
//  EmployerChatListCoordinatorView.swift
//  Logify
//
//  Created by Vlad Klunduk on 09/11/2024.
//

import SwiftUI

struct EmployerChatListCoordinatorView: View {
    @ObservedObject var coordinator: EmployerChatCoordinator = EmployerChatCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(.list)
                .navigationDestination(for: ChatPage.self) { page in
                    coordinator.build(page)
                }
        }
    }
}

#Preview {
    EmployerChatListCoordinatorView(coordinator: EmployerChatCoordinator())
}
