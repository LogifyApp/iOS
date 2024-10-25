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
            .modifier(
                ButtonStyleModifier(
                    width: 320,
                    height: 40,
                    background: .black,
                    foreground: .white
                )
            )
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.background)
        .overlay {
            if isNotificationPresented {
                Text("Request was sent")
                    .fontWeight(.semibold)
                    .padding()
                    .background(.darkBlue)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
                    .transition(.move(edge: .bottom))
                    .frame(maxHeight: .infinity, alignment: .center)
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
