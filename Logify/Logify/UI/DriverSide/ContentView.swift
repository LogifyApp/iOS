//
//  ContentView.swift
//  Logify
//
//  Created by Vlad Klunduk on 19/07/2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var driverManager = DriverManager()
    @State private var selectedItem = 0
    
    var body: some View {
        TabView(selection: $selectedItem) {
            DriverCargoListView(cargoListViewModel: CargoListViewModel())
                .tag(0)
            DriverProfileView(profileViewModel: ProfileViewModel())
                .tag(2)
        }
        .overlay(alignment: .bottom) {
            DriverTabView(selectedItem: $selectedItem)
        }
        .ignoresSafeArea()
        .environmentObject(driverManager)
    }
}

#Preview {
    ContentView()
}
