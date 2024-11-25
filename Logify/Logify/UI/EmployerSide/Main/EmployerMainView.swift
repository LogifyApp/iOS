//
//  EmployerStartView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

enum EmployerTab {
    case cargo, delivery, chat, profile
}

struct EmployerMainView: View {
    @State private var selectedItem = EmployerTab.cargo
    @State private var isTabViewPresented = true
    
    var body: some View {
        TabView(selection: $selectedItem) {
            EmployerCargoListView(
                cargoListViewModel: EmployerCargoListViewModel(),
                isTabViewPresented: $isTabViewPresented
            )
            .tag(EmployerTab.cargo)
            DeliveryView(
                isTabViewPresented: $isTabViewPresented
            )
            .tag(EmployerTab.delivery)
            EmployerChatsListView(
                viewModel: EmployerChatsListViewModel(),
                isTabViewPresented: $isTabViewPresented
            )
            .tag(EmployerTab.chat)
            ProfileView(
                viewModel: ProfileViewModel()
            )
            .tag(EmployerTab.profile)
        }
        .overlay(alignment: .bottom) {
            if isTabViewPresented {
                EmployerTabView(selectedItem: $selectedItem)
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
