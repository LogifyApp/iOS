//
//  EmployerStartView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct EmployerMainView: View {
    @ObservedObject var cordinator = EmployerMainCoordinator()
    @State private var isTabViewPresented = true
    
    var body: some View {
        TabView(selection: $cordinator.selectedTab) {
            EmployerCargoCoordinatorView()
                .tag(Tab.cargo)
            DeliveryView(
                isTabViewPresented: $isTabViewPresented
            )
            .tag(Tab.delivery)
            EmployerChatCoordinatorView()
                .tag(Tab.chat)
            ProfileView(
                viewModel: ProfileViewModel()
            )
            .tag(Tab.profile)
        }
        .overlay(alignment: .bottom) {
            if isTabViewPresented {
                EmployerTabView(selectedItem: $cordinator.selectedTab)
                    .transition(.move(edge: .bottom))
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    EmployerMainView()
}
