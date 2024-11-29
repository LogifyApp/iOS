//
//  NewDriverView.swift
//  Logify
//
//  Created by Vlad Klunduk on 13/10/2024.
//

import SwiftUI

struct NewDriverCell: View {
    var driver: Driver
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(Color.component)
                .shadow(radius: 0.5)
            HStack {
                VStack {
                    Text(driver.getFullName())
                    Text("\(driver.phoneNumber)")
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.system(size: 13))
                    .bold()
                    .foregroundStyle(.secondary)
            }
            .padding()
        }
        .padding(.horizontal)
        .padding(.bottom, 5)
    }
}

#Preview {
    NewDriverCell(driver:
                    Driver(
                        id: 14356,
                        name: "Name",
                        surname: "Surname",
                        phoneNumber: 12837498357,
                        password: "",
                        role: "driver",
                        status: "Available"
                    )
    )
}
