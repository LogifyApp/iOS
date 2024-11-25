//
//  ContentView.swift
//  Logify
//
//  Created by Vlad Klunduk on 19/07/2024.
//

import SwiftUI

enum DriverTab {
    case cargo, employer, chat, profile
}

struct DriverMainView: View {
    @State private var selectedItem = DriverTab.cargo
    @State private var isTabViewPresented = true
    
    var body: some View {
        TabView(selection: $selectedItem) {
            DriverCargoListView(
                viewModel: CargoListViewModel(),
                isTabViewPresented: $isTabViewPresented
            )
            .tag(DriverTab.cargo)
            DriverEmployerView(
                viewModel: EmployersViewModel(),
                isTabViewPresented: $isTabViewPresented
            )
            .tag(DriverTab.employer)
            ProfileView(
                viewModel: ProfileViewModel()
            )
            .tag(DriverTab.profile)
        }
        .overlay(alignment: .bottom) {
            if isTabViewPresented {
                DriverTabView(selectedItem: $selectedItem)
                    .transition(.move(edge: .bottom))
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    DriverMainView()
}
