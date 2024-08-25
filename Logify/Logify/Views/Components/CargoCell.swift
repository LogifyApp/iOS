//
//  CargoCell.swift
//  Logify
//
//  Created by Vlad Klunduk on 19/08/2024.
//

import SwiftUI

struct CargoCell: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.white)
                .shadow(radius: 0.6)
                //.overlay(RoundedRectangle(cornerRadius: 20).stroke(.gray, lineWidth: 1))
            VStack {
                HStack {
                    Text("#2497357")
                    Spacer()
                    Text("Created")
                        
                }.padding(.horizontal)
                //Text("10.04.2024")
            }
        }
        .frame(height: 50)
        .padding(.horizontal)
    }
}

#Preview {
    CargoCell()
}
