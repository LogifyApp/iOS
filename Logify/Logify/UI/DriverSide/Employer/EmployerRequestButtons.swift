//
//  RequestButtons.swift
//  Logify
//
//  Created by Vlad Klunduk on 26/10/2024.
//

import SwiftUI

struct EmployerRequestButtons: View {
    var accept: ()->()
    var decline: ()->()
    
    var body: some View {
        HStack {
            Button("Accept") {
                accept()
            }
            .font(.system(size: 18, weight: .medium))
            .frame(maxWidth: .infinity)
            .padding(20)
            .background(.black)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .padding(.trailing, 10)
            Button("Decline") {
                decline()
            }
            .font(.system(size: 18, weight: .medium))
            .frame(maxWidth: .infinity)
            .padding(20)
            .padding(.horizontal, 5)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
        .padding([.horizontal], 20)
    }
}

#Preview {
    EmployerRequestButtons(
        accept: {},
        decline: {}
    )
        .frame(maxHeight: .infinity)
        .background(Color.background)
}
