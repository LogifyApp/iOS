//
//  EmployerTabView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct EmployerTabView: View {
    @State private var items = ["shippingbox", "box.truck", "message", "person"]
    @Binding var selectedItem: Int
    
    var body: some View {
        ZStack {
            TabViewPanel()
            HStack {
                TabViewButton(imageSystemName: items[0]){
                    items = ["shippingbox.fill", "box.truck", "message", "person"]
                    selectedItem = 0
                }
                TabViewButton(imageSystemName: items[1]){
                    items = ["shippingbox", "box.truck.fill", "message", "person"]
                    selectedItem = 1
                }
                TabViewButton(imageSystemName: items[2]) {
                    items = ["shippingbox", "box.truck", "message.fill", "person"]
                    selectedItem = 2
                }
                TabViewButton(imageSystemName: items[3]){
                    items = ["shippingbox", "box.truck", "message", "person.fill"]
                    selectedItem = 3
                }
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .onAppear {
            items[selectedItem] += ".fill"
        }
    }
}

#Preview {
    EmployerTabView(selectedItem: .constant(0))
}
