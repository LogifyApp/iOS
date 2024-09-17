//
//  TabButton.swift
//  Logify
//
//  Created by Vlad Klunduk on 17/09/2024.
//

import SwiftUI

struct TabViewButton: View {
    
    var action: () -> ()
    var imageSystemName: String
    
    var body: some View {
        Button(action: action){
            Image(systemName: imageSystemName)
                .scaleEffect(1.6)
                .foregroundStyle(Color.white)
        }
        .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
    }
}

#Preview {
    TabViewButton(action: {}, imageSystemName: "profile")
}
