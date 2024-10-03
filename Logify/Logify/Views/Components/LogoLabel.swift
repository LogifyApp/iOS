//
//  LogoLabel.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct LogoLabel: View {
    var body: some View {
        VStack(spacing: 0){
            Image("logo")
                .resizable()
                .frame(width: 200, height: 200)
            Text("Logify")
                .font(.custom("Arial", size: 35))
                .fontWeight(.medium)
        }
    }
}

#Preview {
    LogoLabel()
}
