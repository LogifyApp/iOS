//
//  ContentView.swift
//  Logify
//
//  Created by Vlad Klunduk on 19/07/2024.
//

import SwiftUI

struct DriverMainView: View {
    
    @StateObject private var driverManager = DriverManager()
    @State private var selectedItem = 0
    @State private var isTabViewPresented = true
    
    var body: some View {
        TabView(selection: $selectedItem) {
            DriverCargoListView(
                viewModel: CargoListViewModel(),
                isTabViewPresented: $isTabViewPresented
            )
            .tag(0)
            DriverEmployerView(
                viewModel: EmployersViewModel(),
                isTabViewPresented: $isTabViewPresented
            )
            .tag(1)
            ProfileView(
                viewModel: ProfileViewModel()
            )
            .tag(3)
        }
        .overlay(alignment: .bottom) {
            if isTabViewPresented {
                DriverTabView(selectedItem: $selectedItem)
                    .transition(.move(edge: .bottom))
            }
        }
        .ignoresSafeArea()
        .environmentObject(driverManager)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    DriverMainView()
}
