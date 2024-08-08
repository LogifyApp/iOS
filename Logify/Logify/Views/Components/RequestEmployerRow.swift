//
//  EmployerRequestRow.swift
//  Logify
//
//  Created by Vlad Klunduk on 27/07/2024.
//

import SwiftUI


struct RequestEmployerRow: View {
    @State private var showButtons = false
    
    var body: some View {
        if showButtons {
            VStack {
                UserRow(showButtons: $showButtons)
                HStack {
                    Button(action: {}, label: {
                        ButtonLabel(
                            text: "Accept",
                            width: 130,
                            height: 34,
                            background: .black,
                            foreground: .white)
                    })
                    Spacer()
                    Button(action: {}, label: {
                        ButtonLabel(
                            text: "Decline",
                            width: 130,
                            height: 34,
                            background: .red,
                            foreground: .white)
                    })
                }
                .padding(.horizontal)
            }
        } else {
            UserRow(showButtons: $showButtons)
        }
    }
}


struct UserRow: View {
    @Binding var showButtons: Bool
    
    var body: some View {
        HStack {
            Image("user")
                .resizable()
                .frame(width: 28, height: 28, alignment: .center)
            Text("Name Surname")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(height: 40)
        .foregroundStyle(.black)
        .onTapGesture {
            withAnimation {
                showButtons.toggle()
            }
        }
    }
}

#Preview {
    RequestEmployerRow()
}
