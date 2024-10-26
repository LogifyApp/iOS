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
                .padding([.top, .horizontal], 20)
                .padding(.bottom, 10)
            EmployerRequestButtons(
                accept: {},
                decline: {}
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
    }
}

#Preview {
    EmployerRequestDetailsView(
        isTabViewPresented: .constant(false),
        employer: Employer(id: 2, name: "Mmnmnmnm", surname: "Nmnmnmnmnnm", phoneNumber: 1234535345, password: "", role: "Employer")
    )
}
