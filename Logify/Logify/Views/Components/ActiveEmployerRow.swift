//
//  ActiveEmployerRow.swift
//  Logify
//
//  Created by Vlad Klunduk on 08/08/2024.
//

import SwiftUI

struct ActiveEmployerRow: View {
    
    var body: some View {
        VStack {
            HStack {
                Image("user")
                    .resizable()
                    .frame(width: 70, height: 70, alignment: .center)
                    .padding(.horizontal, 8)
                
                VStack(alignment: .leading) {
                    Text("Name")
                        .font(Font.system(size: 18))
                        .bold()
                    Text("Surname")
                        .font(Font.system(size: 18))
                        .bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Button(action: {}, label: {
                    Image(systemName: "trash.circle")
                        .resizable()
                        .frame(width: 26, height: 26)
                        .foregroundStyle(.red)
                        .frame(maxHeight: .infinity, alignment: .topTrailing)
                })
            }
            
            Button(action: {}, label: {
                ButtonLabel(text: "Chat", width: 320, height: 34, background: .black, foreground: .white)
            })
        }
    }
}

#Preview {
    ActiveEmployerRow()
        .frame(height: 100)
}
