//
//  TabButton.swift
//  Logify
//
//  Created by Vlad Klunduk on 17/09/2024.
//

import SwiftUI

struct TabViewButton: View {
    
    var imageSystemName: String
    var action: () -> ()
    
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
    TabViewButton(imageSystemName: "profile", action: {})
}
