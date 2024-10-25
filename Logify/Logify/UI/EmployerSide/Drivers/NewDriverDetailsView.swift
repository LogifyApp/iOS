//
//  NewDriverDetailsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 13/10/2024.
//

import SwiftUI

struct NewDriverDetailsView: View {
    @State private var isNotificationPresented = false
    var driver: Driver
    
    var body: some View {
        VStack {
            UserDataCell(user: driver)
                .padding(20)
            Spacer()
            Button("Send request") {
                withAnimation {
                    isNotificationPresented = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation(.snappy) {
                        isNotificationPresented = false
                    }
                }
            }
            .frame(width: 320, height: 38)
            .modifier(
                ButtonStyleModifier(
                    background: .black,
                    foreground: .white
                )
            )
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.background)
        .overlay {
            if isNotificationPresented {
                ActionNotificationView(text: "Request was sent")
            }
        }
    }
}

#Preview {
    NavigationView {
        NewDriverDetailsView(driver:
                                Driver(
                                    id: 14356,
                                    name: "Name",
                                    surname: "Surname",
                                    phoneNumber: 12837498357,
                                    password: "",
                                    role: "Driver",
                                    status: "Available"
                                )
        )
    }
}
