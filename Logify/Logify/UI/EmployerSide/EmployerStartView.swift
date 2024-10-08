//
//  EmployerStartView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct EmployerStartView: View {
    @State private var selectedItem = 0
    
    var body: some View {
        TabView(selection: $selectedItem) {
            
        }
        .overlay {
            EmployerTabView(selectedItem: $selectedItem)
        }
    }
}

#Preview {
    EmployerStartView()
}
