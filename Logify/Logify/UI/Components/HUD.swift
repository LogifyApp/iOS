//
//  HUD.swift
//  Logify
//
//  Created by Vlad Klunduk on 29/10/2024.
//

import SwiftUI

struct HUD: View {
    var text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding()
            .background(.darkBlue)
            .clipShape(Capsule())
    }
}

#Preview {
    HUD(text: "ioanodcinas")
}

extension View {
    func hud(_ isPresented: Binding<Bool>, _ text: String) -> some View {
        
            self
            .overlay {
                if isPresented.wrappedValue {
                    HUD(text: text)
                        .frame(maxHeight: .infinity, alignment: .top)
                        .transition(.move(edge: .top))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation(.snappy) {
                                    isPresented.wrappedValue = false
                                }
                            }
                        }
                }
            }
        
    }
}
