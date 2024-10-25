//
//  ActionNotificationView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/10/2024.
//

import SwiftUI

struct ActionNotificationView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .padding()
            .background(.darkBlue)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .transition(.move(edge: .top))
            .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ActionNotificationView(
        text: "Coordinates were copied"
    )
}
