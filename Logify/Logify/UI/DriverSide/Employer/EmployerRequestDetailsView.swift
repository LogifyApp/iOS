//
//  EmployerRequestDetailsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/10/2024.
//

import SwiftUI

struct EmployerRequestDetailsView: View {
    var employer: Employer
    
    var body: some View {
        VStack {
            UserDataCell(user: employer)
                .padding(20)
            Spacer()
            Button("Accept") {
                
            }
            .modifier(
                ButtonStyleModifier(
                    
                    background: .black,
                    foreground: .white
                )
            )
            Button("Decline") {
                
            }
            .modifier(
                ButtonStyleModifier(
                    
                    background: .black,
                    foreground: .white
                )
            )
        }
        .navigationTitle("Request details")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.background)
    }
}

#Preview {
    EmployerRequestDetailsView(
        employer: Employer(id: 2, name: "Name", surname: "Surname", phoneNumber: 1234535345, password: "", role: "Employer")
    )
}
