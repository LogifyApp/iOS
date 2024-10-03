//
//  CarDetailsRow.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct CarDetailsRow: View {
    var car: Car
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.white)
                .shadow(radius: 0.5)
            HStack {
                VStack(alignment: .leading) {
                    Text(car.plate)
                    if let brand = car.brand, let model = car.model {
                        Text(brand + " " + model)
                            .font(.subheadline)
                    }
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
    CarDetailsRow(car: Car(plate: "PP6745C",
                           brand: "Ford",
                           model: "Focus",
                           status: 0,
                           isDeleted: 0,
                           employerId: 1
                          )
    )
}
