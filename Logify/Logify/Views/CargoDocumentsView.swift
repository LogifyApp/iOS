//
//  CargoDocumentsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 06/09/2024.
//

import SwiftUI

struct CargoDocumentsView: View {
    var body: some View {
        List {
            Section {
                Text("Document 1")
                Text("Document 2")
                Text("Document 3")
                Text("Document 4")
            }
        }
        .navigationTitle("Documents")
        .scrollContentBackground(.hidden)
        .background(Color.background)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    
                }) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    CargoDocumentsView()
}
