//
//  ContentView.swift
//  Logify
//
//  Created by Vlad Klunduk on 19/07/2024.
//

import SwiftUI

struct DriverContentView: View {
    @StateObject private var driverManager = DriverManager()
    @State private var selectedItem = 0
    
    var body: some View {
        TabView(selection: $selectedItem) {
            DriverCargoView()
                .tag(0)
            DriverChatView()
                .tag(1)
            DriverProfileView()
                .tag(2)
        }
        .overlay(alignment: .bottom) {
            CustomTabView(selectedItem: $selectedItem)
        }.ignoresSafeArea()
    }
}

#Preview {
    DriverContentView()
}
