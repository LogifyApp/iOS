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
                cargoListViewModel: CargoListViewModel(),
                isTabViewPresented: $isTabViewPresented
            )
            .tag(0)
            DriverProfileView(profileViewModel: ProfileViewModel())
                .tag(2)
        }
        .overlay(alignment: .bottom) {
            if isTabViewPresented {
                DriverTabViewPanel(selectedItem: $selectedItem)
                    .transition(.move(edge: .bottom))
            }
        }
        .ignoresSafeArea()
        .environmentObject(driverManager)
    }
}

#Preview {
    DriverMainView()
}
