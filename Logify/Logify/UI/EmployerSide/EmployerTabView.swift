//
//  EmployerTabView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct EmployerTabView: View {
    @State private var items = ["shippingbox.fill", "person.2", "message", "person"]
    @State private var isChatPresented = false
    @Binding var selectedItem: Int
    
    var body: some View {
        ZStack {
            TabViewPanel()
            HStack {
                TabViewButton(imageSystemName: items[0]){
                    items = ["shippingbox.fill", "person.2", "message", "person"]
                    selectedItem = 0
                }
                TabViewButton(imageSystemName: items[1]){
                    items = ["shippingbox", "person.2.fill", "message", "person"]
                    selectedItem = 1
                }
                TabViewButton(imageSystemName: items[2]) {
                    isChatPresented.toggle()
                }
                .fullScreenCover(isPresented: $isChatPresented) {
                    /*ChatView(
                        chatViewModel: ChatViewModel(driver: <#T##Driver#>, employer: <#T##Employer#>),
                        senderId: 0
                    )*/
                }
                TabViewButton(imageSystemName: items[3]){
                    items = ["shippingbox", "person.2", "message", "person.fill"]
                    selectedItem = 3
                }
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
}

#Preview {
    EmployerTabView(selectedItem: .constant(0))
}
