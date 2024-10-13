//
//  ListDetailRow.swift
//  Logify
//
//  Created by Vlad Klunduk on 11/10/2024.
//

import SwiftUI

struct ListDetailRow: View {
    
    let property: String
    let value: String
    
    var body: some View {
        HStack {
            Text(property)
                .foregroundStyle(.secondary)
            Spacer()
            Text(value)
        }
    }
}
