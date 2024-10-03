//
//  B.swift
//  Logify
//
//  Created by Vlad Klunduk on 02/09/2024.
//

import SwiftUI

struct ButtonStyle: ViewModifier {
    let width: CGFloat
    let height: CGFloat
    let background: Color
    let foreground: Color
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: width, maxHeight: height)
            .fontWeight(.medium)
            .background(background)
            .foregroundColor(foreground)
            .clipShape(Capsule())
    }
}
