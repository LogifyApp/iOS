//
//  CargoCell.swift
//  Logify
//
//  Created by Vlad Klunduk on 19/08/2024.
//

import SwiftUI

struct CargoCell: View {
    
    let cargoId: Int
    let cargoStatus: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.white)
                .shadow(radius: 0.5)
            HStack {
                Text("#\(cargoId)")
                Spacer()
                Text(cargoStatus)
            }
            .padding(.horizontal)
        }
        .frame(height: 50)
        .padding(.horizontal)
    }
}

#Preview {
    CargoCell(cargoId: 234, cargoStatus: "Created")
}
