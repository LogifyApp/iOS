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
    
    var body: some View {
        Text(text)
            .frame(width: 320, height: 34)
            .font(.title3)
            .bold()
            .background(backround)
            .foregroundColor(foreground)
            .clipShape(Capsule())
            .padding()
    }
}

#Preview {
    NavigationText(text: "Log in", foreground: .white, backround: .black)
}
