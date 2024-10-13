//
//  EmployerStartView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct EmployerStartView: View {
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
            EmployerProfileView(
                profileViewModel: EmployerProfileViewModel()
            )
            .tag(3)
        }
        .overlay(alignment: .bottom) {
            if isTabViewPresented {
                EmployerTabView(selectedItem: $selectedItem)
                    .transition(.move(edge: .bottom))
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    EmployerStartView()
}
