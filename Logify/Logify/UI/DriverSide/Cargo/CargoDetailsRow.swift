//
//  CargoCell.swift
//  Logify
//
//  Created by Vlad Klunduk on 19/08/2024.
//

import SwiftUI

struct CargoDetailsRow: View {
    
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
                Image(systemName: "chevron.right")
                    .font(.system(size: 13))
                    .bold()
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal)
        }
        .frame(height: 50)
        .padding(.horizontal)
    }
}

#Preview {
    CargoDetailsRow(cargoId: 234, cargoStatus: "Created")
}
