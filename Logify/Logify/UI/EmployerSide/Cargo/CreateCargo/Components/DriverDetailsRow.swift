//
//  DriverDetailsRow.swift
//  Logify
//
//  Created by Vlad Klunduk on 05/10/2024.
//

import SwiftUI

struct DriverDetailsRow: View {
    var driver: Driver
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("#\(driver.id)")
                    .fontWeight(.medium)
                    .padding(.bottom, 5)
                Text(driver.getFullName())
                Text("\(driver.phoneNumber)")
            }
            .frame(maxHeight: .infinity, alignment: .top)
            Spacer()
            Text("Available")
                .frame(maxHeight: .infinity, alignment: .top)
        }
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
                            role: "driver",
                            status: "Available"
                        )
    )
}
