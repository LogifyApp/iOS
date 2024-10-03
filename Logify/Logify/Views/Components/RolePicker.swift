//
//  RolePicker.swift
//  Logify
//
//  Created by Vlad Klunduk on 21/07/2024.
//

import SwiftUI

struct RolePicker: View {
    @State private var role = "Driver"
    
    var body: some View {
        VStack {
            Text("Select your role")
            Picker("", selection: $role){
                Text("Driver")
                    .tag("Driver")
                Text("Employer")
                    .tag("Employer")
            }
            .frame(width: 320)
            .pickerStyle(.segmented)
        }
        .padding()
    }
}

#Preview {
    RolePicker()
}
