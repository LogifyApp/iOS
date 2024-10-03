//
//  SubmitButton.swift
//  Logify
//
//  Created by Vlad Klunduk on 21/07/2024.
//

import SwiftUI

struct NavigationText: View {
    let text: String
    let foreground: Color
    let backround: Color
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Text(text)
            .frame(width: width, height: height)
            .font(.title3)
            .fontWeight(.medium)
            .background(backround)
            .foregroundColor(foreground)
            .clipShape(Capsule())
            .padding()
    }
}

#Preview {
    NavigationText(
        text: "Log in",
        foreground: .white,
        backround: .black,
        width: 320,
        height: 40
    )
}
