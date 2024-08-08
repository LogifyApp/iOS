//
//  CustomHeader.swift
//  Logify
//
//  Created by Vlad Klunduk on 08/08/2024.
//

import SwiftUI

struct SectionHeader: View {
    let text: String
    
    var body: some View {
        Text(text)
            .foregroundStyle(.black)
            .font(.system(size: 20))
            .textCase(.none)
            .bold()
    }
}

#Preview {
    SectionHeader(text: "text")
}
