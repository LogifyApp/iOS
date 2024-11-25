//
//  EmployerTabView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct EmployerTabView: View {
    @State private var items = ["shippingbox.fill", "box.truck", "message", "person"]
    @Binding var selectedItem: EmployerTab
    
    var body: some View {
        ZStack {
            TabViewPanel()
            HStack {
                TabViewButton(imageSystemName: items[0]){
                    items = ["shippingbox.fill", "box.truck", "message", "person"]
                    selectedItem = .cargo
                }
                TabViewButton(imageSystemName: items[1]){
                    items = ["shippingbox", "box.truck.fill", "message", "person"]
                    selectedItem = .delivery
                }
                TabViewButton(imageSystemName: items[2]) {
                    items = ["shippingbox", "box.truck", "message.fill", "person"]
                    selectedItem = .chat
                }
                TabViewButton(imageSystemName: items[3]){
                    items = ["shippingbox", "box.truck", "message", "person.fill"]
                    selectedItem = .profile
                }
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
}

#Preview {
    EmployerTabView(selectedItem: .constant(.cargo))
}
