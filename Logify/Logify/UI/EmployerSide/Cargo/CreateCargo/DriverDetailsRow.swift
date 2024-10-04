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
                Spacer(minLength: 12)
                Text(driver.getFullName())
                Text("\(driver.phoneNumber)")
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("Available")
                Spacer()
            }
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
                            role: "driver"
                        )
    )
}
