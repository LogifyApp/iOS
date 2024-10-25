//
//  EmployerRequestDetailsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/10/2024.
//

import SwiftUI

struct EmployerRequestDetailsView: View {
    @Binding var isTabViewPresented: Bool
    var employer: Employer
    
    var body: some View {
        VStack {
            UserDataCell(user: employer)
                .padding(20)
            Spacer()
            HStack {
                Button("Accept") {
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 38)
                .modifier(
                    ButtonStyleModifier(
                        background: .black,
                        foreground: .white
                    )
                )
                Button("Decline") {
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 38)
                .modifier(
                    ButtonStyleModifier(
                        background: .red,
                        foreground: .white
                    )
                )
            }
            .padding([.horizontal], 20)
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.background)
        .toolbarBackground(.thinMaterial, for: .navigationBar)
        .onAppear {
            withAnimation {
                isTabViewPresented = false
            }
        }
    }
}

#Preview {
    EmployerRequestDetailsView(
        isTabViewPresented: .constant(false),
        employer: Employer(id: 2, name: "Name", surname: "Surname", phoneNumber: 1234535345, password: "", role: "Employer")
    )
}
