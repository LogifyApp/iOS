//
//  EmployerStartView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct EmployerMainView: View {
    @State private var selectedItem = Tab.cargo
    @State private var isTabViewPresented = true
    
    var body: some View {
        TabView(selection: $selectedItem) {
            EmployerCargoListView(
                cargoListViewModel: EmployerCargoListViewModel(),
                isTabViewPresented: $isTabViewPresented
            )
            .tag(Tab.cargo)
            DeliveryView(
                isTabViewPresented: $isTabViewPresented
            )
            .tag(Tab.delivery)
            EmployerChatsListView(
                viewModel: EmployerChatsListViewModel(),
                isTabViewPresented: $isTabViewPresented
            )
            .tag(Tab.chat)
            ProfileView(
                viewModel: ProfileViewModel()
            )
            .tag(Tab.profile)
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
