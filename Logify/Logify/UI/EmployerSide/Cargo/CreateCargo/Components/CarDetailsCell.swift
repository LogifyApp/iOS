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
        CarDetailsRow(car: car)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(Color.component)
                    .shadow(radius: 0.5)
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
