//
//  CustomTabView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import SwiftUI

struct CustomTabView: View {
    
    @Binding var selectedItem: Int
    @State private var items = ["shippingbox.fill", "message", "person"]
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 90)
                .foregroundStyle(Color.background)
                .offset(y: 45)
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
                    .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
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
