//
//  EmployerRequestRow.swift
//  Logify
//
//  Created by Vlad Klunduk on 27/07/2024.
//

import SwiftUI


struct RequestEmployerRow: View {
    
    @State private var showButtons = false
    var employer: Employer
    var acceptRequest: () -> ()
    var declineRequest: () -> ()
    
    var body: some View {
        DisclosureGroup(
            content: {
                HStack {
                    Button(action: {
                        acceptRequest()
                    }, label: {
                        ButtonLabel(
                            text: "Accept",
                            width: .infinity,
                            height: 30,
                            background: .black,
                            foreground: .white)
                    })
                    Button(action: {
                        declineRequest()
                    }, label: {
                        ButtonLabel(
                            text: "Decline",
                            width: .infinity,
                            height: 30,
                            background: .red,
                            foreground: .white)
                    })
                }
                .listRowSeparator(.hidden, edges: .top)
            },
            label: {
                HStack {
                    Image("user")
                        .resizable()
                        .frame(width: 28, height: 28, alignment: .center)
                    Text("\(employer.name) \(employer.surname)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(height: 37)
                .foregroundStyle(.black)
            }
        )
    }
}

#Preview {
    RequestEmployerRow(employer: Employer(id: 0, name: "Name", surname: "Surname", phoneNumber: 381475456, password: "owubr", role: "", drivers: []), acceptRequest: {}, declineRequest: {})
}
