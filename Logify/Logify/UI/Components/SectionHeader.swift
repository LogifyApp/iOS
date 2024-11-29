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
            .foregroundStyle(Color.text)
            .font(.system(.title3, weight: .medium))
            .textCase(.none)
    }
}


#Preview {
    SectionHeader(text: "text")
}
