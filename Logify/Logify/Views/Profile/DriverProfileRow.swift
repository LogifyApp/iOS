//
//  DriverProfileRow.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/09/2024.
//

import Foundation
import SwiftUI

struct DriverProfileRow: View {
    
    @EnvironmentObject var driverManager: DriverManager
    
    var body: some View {
        HStack {
            Image("user")
                .resizable()
                .frame(width: 100, height: 100)
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text(driverManager.driver.name + " " + driverManager.driver.surname)
                    .font(.title3)
                    .bold()
                Text("\(driverManager.driver.phoneNumber)")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical)
    }
}
