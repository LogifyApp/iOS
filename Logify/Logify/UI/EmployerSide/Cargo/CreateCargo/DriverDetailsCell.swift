//
//  DriverDetailsRow.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct DriverDetailsCell: View {
    var driver: Driver
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.white)
                .shadow(radius: 0.5)
            DriverDetailsRow(driver: driver)
                .padding()
        }
        .padding(.horizontal)
        .padding(.bottom, 5)
    }
}

#Preview {
    DriverDetailsCell(driver: 
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
