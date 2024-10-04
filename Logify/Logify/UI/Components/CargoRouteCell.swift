//
//  CargoRouteCell.swift
//  Logify
//
//  Created by Vlad Klunduk on 04/10/2024.
//

import SwiftUI

struct CargoRouteCell: View {
    
    let name: String
    let coordinates: String
    let isLast: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "circle.dashed")
                    .foregroundStyle(.blue)
                Text(name)
                    .font(.system(size: 18))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 8)
            
            HStack {
                VStack() {
                    if isLast {
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.clear)
                    } else {
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.blue)
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.blue)
                    }
                }
                .padding(.vertical)
                Button(action: {
                    UIPasteboard.general.string = coordinates
                }) {
                    Image(systemName: "rectangle.portrait.on.rectangle.portrait")
                }
                .buttonStyle(PlainButtonStyle())
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            }
        }
    }
}

#Preview {
    CargoRouteCell(
        name: "Point 1",
        coordinates: "9374345345345345 34523453445y4464564645",
        isLast: false
    )
    .frame(height: 40)
    .padding()
}
