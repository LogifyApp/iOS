//
//  CustomTabView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import SwiftUI

struct CustomTabView: View {
    
    @State private var items = ["shippingbox.fill", "message", "person"]
    @State private var isPresented = false
    @Binding var selectedItem: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 90)
                .foregroundStyle(Color.background)
                .offset(y: 45)
            Capsule()
                .frame(height: 60)
                .foregroundStyle(Color.systemBlue)
            HStack {
                TabViewButton(action: {
                    selectedItem = 0
                    items = ["shippingbox.fill", "message", "person"]
                }, imageSystemName: items[0])
                
                TabViewButton(action: {
                    isPresented.toggle()
                }, imageSystemName: items[1])
                .fullScreenCover(isPresented: $isPresented, content: {
                    DriverChatView()
                })
                
                TabViewButton(action: {
                    selectedItem = 2
                    items = ["shippingbox", "message", "person.fill"]
                }, imageSystemName: items[2])
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
}

#Preview {
    CustomTabView(selectedItem: .constant(1))
}

