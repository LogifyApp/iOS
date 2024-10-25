//
//  CustomTabView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import SwiftUI

struct DriverTabViewPanel: View {
    
    @EnvironmentObject var driverManager: DriverManager
    @State private var items = ["shippingbox.fill", "doc.text", "message", "person"]
    @State private var isChatViewPresented = false
    @Binding var selectedItem: Int
    
    var body: some View {
        ZStack {
            TabViewPanel()
            HStack {
                TabViewButton(imageSystemName: items[0]) {
                    selectedItem = 0
                    items = ["shippingbox.fill", "doc.text", "message", "person"]
                }
                TabViewButton(imageSystemName: items[1]) {
                    selectedItem = 1
                    items = ["shippingbox", "doc.text.fill", "message", "person"]
                }
                TabViewButton(imageSystemName: items[2]) {
                    isChatViewPresented.toggle()
                }
                TabViewButton(imageSystemName: items[3]) {
                    selectedItem = 3
                    items = ["shippingbox", "doc.text", "message", "person.fill"]
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
    DriverTabViewPanel(selectedItem: .constant(1))
        .environmentObject(DriverManager())
}

