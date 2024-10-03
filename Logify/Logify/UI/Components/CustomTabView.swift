//
//  CustomTabView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import SwiftUI

struct CustomTabView: View {
    
    @EnvironmentObject var driverManager: DriverManager
    @State private var items = ["shippingbox.fill", "message", "person"]
    @State private var isChatViewPresented = false
    @Binding var selectedItem: Int
    
    var body: some View {
        ZStack {
            TabViewPanel()
            HStack {
                TabViewButton(imageSystemName: items[0]) {
                    selectedItem = 0
                    items = ["shippingbox.fill", "message", "person"]
                }
                TabViewButton(imageSystemName: items[1]) {
                    isChatViewPresented.toggle()
                }
                .fullScreenCover(isPresented: $isChatViewPresented) {
                    ChatView(
                        chatViewModel:
                            ChatViewModel(
                                driver: driverManager.driver,
                                employer: driverManager.getActiveEmployer()!
                            ),
                        senderId: driverManager.driver.id
                    )
                }
                TabViewButton(imageSystemName: items[2]) {
                    selectedItem = 2
                    items = ["shippingbox", "message", "person.fill"]
                }
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
}

struct TabViewPanel: View {
    var body: some View {
        Rectangle()
            .frame(height: 90)
            .foregroundStyle(Color.background)
            .offset(y: 45)
        Capsule()
            .frame(height: 60)
            .foregroundStyle(Color.darkBlue)
    }
}

#Preview {
    CustomTabView(selectedItem: .constant(1))
        .environmentObject(DriverManager())
}

