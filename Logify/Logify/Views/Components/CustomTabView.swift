//
//  CustomTabView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var selectedItem: Int
    @State private var items = ["shippingbox", "message", "person"]
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 60)
                .foregroundStyle(Color.systemBlue)
            HStack {
                ForEach(0..<3) { index in
                    Button(action: {
                        selectedItem = index
                        items = ["shippingbox", "message", "person"]
                        items[index] = "\(items[index]).fill"
                    }){
                        Image(systemName: items[index])
                            .scaleEffect(1.6)
                            .foregroundStyle(Color.white)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
}

#Preview {
    CustomTabView(selectedItem: .constant(1))
}
