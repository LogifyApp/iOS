//
//  CarDetailsRow.swift
//  Logify
//
//  Created by Vlad Klunduk on 06/10/2024.
//

import SwiftUI

struct CarDetailsRow: View {
    var car: Car
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(car.plate)
                    .fontWeight(.medium)
                    .padding(.bottom, 5)
                if let brand = car.brand, let model = car.model {
                    Text(brand + " " + model)
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            Spacer()
            //MARK: Car status??
            Text("Available")
                .frame(maxHeight: .infinity, alignment: .top)
        }
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
