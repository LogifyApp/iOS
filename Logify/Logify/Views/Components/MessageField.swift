//
//  MessageField.swift
//  Logify
//
//  Created by Vlad Klunduk on 15/09/2024.
//

import SwiftUI

struct MessageField: View {
    
    @FocusState.Binding var isFocused: Bool
    @Binding var text: String
    var action: () -> ()
    
    var body: some View {
        HStack {
            TextField("Message", text: $text)
                .padding(8)
                .padding(.leading, 6)
                .keyboardType(.default)
                .overlay(
                    RoundedRectangle(cornerRadius: 25.0)
                        .stroke(.gray, lineWidth: 1.0))
                .focused($isFocused)
            Button(action: action) {
                Image(systemName: "arrow.up.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
        }
        .padding(.horizontal, 10)
        .padding(.bottom, 6)
    }
}

