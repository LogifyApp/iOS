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
                .frame(height: 70)
                .foregroundStyle(Color.systemBlue)
            HStack(spacing: 60) {
                ForEach(0..<3) { index in
                    ZStack {
                        Circle()
                            .frame(height: 50)
                            .foregroundStyle(Color.white)
                            
                        Button(action: {
                            selectedItem = index
                            items = ["shippingbox", "message", "person"]
                            items[index] = "\(items[index]).fill"
                        }){
                            Image(systemName: items[index])
                                .scaleEffect(1.6)
                                .foregroundStyle(Color.systemBlue)
                                
                        }
                        .padding()
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    CustomTabView(selectedItem: .constant(1))
}
