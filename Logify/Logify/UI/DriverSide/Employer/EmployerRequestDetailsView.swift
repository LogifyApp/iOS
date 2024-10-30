//
//  EmployerRequestDetailsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/10/2024.
//

import SwiftUI

struct EmployerRequestDetailsView: View {
    @State private var isDeclineConfirmationPresented = false
    @Binding var isTabViewPresented: Bool
    var employer: Employer
    
    var body: some View {
        VStack {
            UserDataCell(user: employer)
                .padding([.top, .horizontal], 20)
                .padding(.bottom, 10)
            EmployerRequestButtons(
                accept: {
                    
                },
                decline: {
                    isDeclineConfirmationPresented = true
                }
            )
            Spacer()
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
        .confirmationDialog("Decline request", isPresented: $isDeclineConfirmationPresented) {
            Button("Decline", role: .destructive) {
                
            }
        } message: {
            Text("Are you sure you want to decline request?")
        }
    }
}

#Preview {
    EmployerRequestDetailsView(
        isTabViewPresented: .constant(false),
        employer: Employer(id: 2, name: "Mmnmnmnm", surname: "Nmnmnmnmnnm", phoneNumber: 1234535345, password: "", role: "Employer")
    )
}
