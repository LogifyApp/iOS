//
//  NewDriverDetailsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 13/10/2024.
//

import SwiftUI

struct NewDriverDetailsView: View {
    @State private var isNotificationPresented = false
    @State private var isAlertPresented = false
    var driver: Driver
    
    var body: some View {
        VStack {
            UserDataCell(user: driver)
                .padding([.top, .horizontal], 20)
                .padding(.bottom, 10)
            Button {
                withAnimation {
                    isAlertPresented = true
                }
            } label: {
                Text("Send Request")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(20)
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .padding(.horizontal, 20)
            }
            Spacer()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.background)
        .hud($isAlertPresented, "Request was sent")
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
