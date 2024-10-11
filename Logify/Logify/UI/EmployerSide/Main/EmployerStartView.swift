//
//  EmployerStartView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct EmployerStartView: View {
    @State private var selectedItem = 0
    @State private var hideTabView = false
    
    var body: some View {
        TabView(selection: $selectedItem) {
            EmployerCargoListView(
                cargoListViewModel: EmployerCargoListViewModel(),
                hideTabView: $hideTabView
            )
            .tag(0)
            EmployerProfileView(
                profileViewModel: EmployerProfileViewModel()
            )
            .tag(3)
        }
        .overlay(alignment: .bottom) {
            if !hideTabView {
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
