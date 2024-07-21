//
//  SubmitButton.swift
//  Logify
//
//  Created by Vlad Klunduk on 21/07/2024.
//

import SwiftUI

struct SubmitButton: View {
    let text: String
    let action: () -> Void
    let foreground: Color
    let backround: Color
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .frame(width: 320, height: 34)
                .font(.title3)
                .bold()
                .background(backround)
                .foregroundColor(foreground)
                .clipShape(Capsule())
        }
        .padding()
    }
}

#Preview {
    SubmitButton(text: "Log in", action: {}, foreground: .white, backround: .black)
}
