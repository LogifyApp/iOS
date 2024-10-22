//
//  RolePicker.swift
//  Logify
//
//  Created by Vlad Klunduk on 21/07/2024.
//

import SwiftUI

struct RolePicker: View {
    @Binding var role: Role
    
    var body: some View {
        VStack {
            Text("Select your role")
            Picker("", selection: $role){
                Text("Driver")
                    .tag(Role.driver)
                Text("Employer")
                    .tag(Role.employer)
            }
            .frame(width: 320)
            .pickerStyle(.segmented)
        }
        .padding()
    }
}

#Preview {
    RolePicker(role: .constant(.driver))
}
