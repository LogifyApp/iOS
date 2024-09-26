//
//  ButtonLabel.swift
//  Logify
//
//  Created by Vlad Klunduk on 08/08/2024.
//

import SwiftUI

struct ButtonLabel: View {
    let text: String
    let width: CGFloat
    let height: CGFloat
    let background: Color
    let foreground: Color
    
    var body: some View {
        Text(text)
            .frame(maxWidth: width, maxHeight: height)
            //.bold()
            .background(background)
            .foregroundColor(foreground)
            .clipShape(Capsule())
    }
}

#Preview {
    ButtonLabel(text: "Cancel", width: 120, height: 34, background: .black, foreground: .white)
}
