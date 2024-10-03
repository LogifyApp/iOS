//
//  DriverProfileRow.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/09/2024.
//

import Foundation
import SwiftUI

struct UserDataRow: View {
    
    var user: User
    var imageWidth: CGFloat
    
    var body: some View {
        HStack {
            Image("user")
                .resizable()
                .frame(width: imageWidth, height: imageWidth)
                .padding(.trailing, imageWidth/9)
            VStack(alignment: .leading) {
                Text(user.getFullName())
                    .font(.title3)
                    .bold()
                Text("\(user.phoneNumber)")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical)
    }
}
