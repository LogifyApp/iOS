//
//  DriverDetailsRow.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct DriverDetailsRow: View {
    var driver: Driver
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.white)
                .shadow(radius: 0.5)
            HStack {
                VStack(alignment: .leading) {
                    Text(driver.getFullName())
                    Text("#\(driver.id)")
                        .font(.subheadline)
                }
                Spacer()
                Text("Available")
                Image(systemName: "chevron.right")
                    .font(.system(size: 13))
                    .bold()
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal)
        }
        .frame(height: 60)
        .padding(.horizontal)
    }
}

#Preview {
    DriverDetailsRow(driver: 
                        Driver(
                            id: 14356,
                            name: "Name",
                            surname: "Surname",
                            phoneNumber: 12837498357,
                            password: "",
                            role: "driver"
                        )
    )
}
