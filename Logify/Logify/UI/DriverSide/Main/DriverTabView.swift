//
//  CustomTabView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import SwiftUI

struct DriverTabView: View {
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
                        driver: Driver(id: 1, name: "Name", surname: "Surname", phoneNumber: 12837498357, password: "", role: "Driver", status: "Available"),
                        employer: Employer(id: 2, name: "Name", surname: "Surname", phoneNumber: 1234535345, password: "", role: "Employer")
                    ),
                senderId: 1
            )
        }
    }
}

#Preview {
    DriverTabView(selectedItem: .constant(DriverTab.cargo))
        .environmentObject(DriverManager())
}

