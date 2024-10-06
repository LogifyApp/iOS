//
//  CargoRouteCell.swift
//  Logify
//
//  Created by Vlad Klunduk on 04/10/2024.
//

import SwiftUI

struct PointRow: View {
    
    let point: Point
    let isLast: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "circle.dashed")
                    .foregroundStyle(.blue)
                    .padding(.trailing)
                Text(point.label)
                    .font(.system(size: 18))
                Spacer()
            }
            if !isLast {
                VStack() {
                    Image(systemName: "chevron.down")
                        .foregroundStyle(.blue)
                    Image(systemName: "chevron.down")
                        .foregroundStyle(.blue)
                }
                .padding(.top)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    PointRow(
        point: Point(id: 0, label: "start", latitude: 52.219420, longtitude: 20.983114, order: 0, cargoId: 1),
        isLast: false
    )
    .frame(height: 40)
    .padding()
}
