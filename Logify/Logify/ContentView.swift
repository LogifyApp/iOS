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
            DriverCargoListView(cargoListViewModel: CargoListViewModel(driver: Driver(id: 1, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "")))
                .tag(0)
            DriverProfileView()
                .tag(2)
        }
        .overlay(alignment: .bottom) {
            CustomTabView(selectedItem: $selectedItem)
        }
        .ignoresSafeArea()
        .environmentObject(driverManager)
    }
}

#Preview {
    ContentView()
}
