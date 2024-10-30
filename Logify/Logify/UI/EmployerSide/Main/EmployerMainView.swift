//
//  EmployerStartView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct EmployerMainView: View {
    @State private var selectedItem = 0
    @State private var isTabViewPresented = true
    
    var body: some View {
        TabView(selection: $selectedItem) {
            EmployerCargoListView(
                cargoListViewModel: EmployerCargoListViewModel(),
                isTabViewPresented: $isTabViewPresented
            )
            .tag(0)
            EmployerDriversListView(
                viewModel: EmployerDriversListViewModel(),
                isTabViewPresented: $isTabViewPresented
            )
            .tag(1)
            EmployerChatsListView(
                viewModel: EmployerChatsListViewModel(),
                isTabViewPresented: $isTabViewPresented
            )
            .tag(2)
            ProfileView(
                viewModel: ProfileViewModel()
            )
            .tag(3)
        }
        .overlay(alignment: .bottom) {
            if isTabViewPresented {
                EmployerTabViewPanel(selectedItem: $selectedItem)
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
