//
//  CustomTabView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import SwiftUI

struct DriverTabView: View {
    @EnvironmentObject var driverManager: DriverManager
    @State private var items = ["shippingbox.fill", "box.truck", "message", "person"]
    @State private var isChatViewPresented = false
    @Binding var selectedItem: DriverTab
    
    var body: some View {
        ZStack {
            TabViewPanel()
            HStack {
                TabViewButton(imageSystemName: items[0]) {
                    items = ["shippingbox.fill", "box.truck", "message", "person"]
                    selectedItem = DriverTab.cargo
                }
                TabViewButton(imageSystemName: items[1]) {
                    items = ["shippingbox", "box.truck.fill", "message", "person"]
                    selectedItem = DriverTab.employer
                }
                TabViewButton(imageSystemName: items[2]) {
                    isChatViewPresented.toggle()
                }
                TabViewButton(imageSystemName: items[3]) {
                    items = ["shippingbox", "box.truck", "message", "person.fill"]
                    selectedItem = DriverTab.profile
                }
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .fullScreenCover(isPresented: $isChatViewPresented) {
            DriverChatView(viewModel:
                    ChatViewModel(
                        driver: driverManager.driver,
                        employer: driverManager.getActiveEmployer()!
                    ),
                senderId: driverManager.driver.id
            )
        }
    }
}

#Preview {
    DriverTabView(selectedItem: .constant(DriverTab.cargo))
        .environmentObject(DriverManager())
}

