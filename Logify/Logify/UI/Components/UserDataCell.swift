//
//  DriverProfileRow.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/09/2024.
//

import Foundation
import SwiftUI

struct UserDataCell: View {
    
    var user: User
    var imageWidth: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(profileViewModel.employer.getFullName())
                .font(.system(size: 34, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(28)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .padding(.bottom, 10)
            HStack {
                Text("\(profileViewModel.employer.phoneNumber)")
                    .font(.system(size: 18, weight: .medium))
                    .frame(maxWidth: .infinity)
                    .padding(20)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .padding(.trailing, 10)
                    .lineLimit(1)
                Text("Employer")
                    .font(.system(size: 18, weight: .medium))
                    .padding(20)
                    .padding(.horizontal, 5)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }
        }
    }
}
