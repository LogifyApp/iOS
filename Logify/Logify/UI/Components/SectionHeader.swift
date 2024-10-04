//
//  SectionHeader.swift
//  Logify
//
//  Created by Vlad Klunduk on 28/08/2024.
//

import SwiftUI

struct SectionHeader: View {
    let text: String
    
    var body: some View {
        Text(text)
            .foregroundStyle(.black)
            .font(.title3)
            .textCase(.none)
            .fontWeight(.medium)
    }
}


#Preview {
    SectionHeader(text: "text")
}
