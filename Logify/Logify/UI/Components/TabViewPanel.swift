//
//  TabViewPanel.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct TabViewPanel: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 90)
                .foregroundStyle(Color.background)
                .offset(y: 45)
            Capsule()
                .frame(height: 60)
                .foregroundStyle(Color.darkBlue)
        }
    }
}

#Preview {
    TabViewPanel()
}
