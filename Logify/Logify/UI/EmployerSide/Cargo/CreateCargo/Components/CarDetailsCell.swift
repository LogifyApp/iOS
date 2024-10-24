//
//  CarDetailsRow.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct CarDetailsCell: View {
    var car: Car
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.white)
                .shadow(radius: 0.5)
            CarDetailsRow(car: car)
                .padding()
        }
        .padding(.horizontal)
        .padding(.bottom, 5)
    }
}

#Preview {
    CarDetailsCell(car: Car(plate: "PP6745C",
                           brand: "Ford",
                           model: "Focus",
                           status: 0,
                           isDeleted: 0,
                           employerId: 1
                          )
    )
}
