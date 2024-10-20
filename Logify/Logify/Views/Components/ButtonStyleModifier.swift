//
//  ButtonStyleModifier.swift
//  Logify
//
//  Created by Vlad Klunduk on 21/10/2024.
//

import SwiftUI

struct ButtonStyleModifier: ViewModifier {
    let width: CGFloat
    let height: CGFloat
    let background: Color
    let foreground: Color
    
    func body(content: Content) -> some View {
        content
            .frame(width: width, height: height)
            .fontWeight(.medium)
            .background(background)
            .foregroundColor(foreground)
            .clipShape(Capsule())
    }
}
