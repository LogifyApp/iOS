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
        VStack {
            DisclosureGroup(
                content: {
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
                    .padding([.top, .horizontal])
                },
                label: {
                    HStack {
                        Image("user")
                            .resizable()
                            .frame(width: 28, height: 28, alignment: .center)
                        Text("Name Surname")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(height: 37)
                    .foregroundStyle(.black)
                }
            )
        }
    }
}

#Preview {
    RequestEmployerRow()
}
