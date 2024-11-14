//
//  EmployerChatListCoordinatorView.swift
//  Logify
//
//  Created by Vlad Klunduk on 09/11/2024.
//

import SwiftUI

struct EmployerChatCoordinatorView: View {
    @StateObject var coordinator = EmployerChatCoordinator()
    
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
    EmployerChatCoordinatorView(coordinator: EmployerChatCoordinator())
}
