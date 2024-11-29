//
//  EmployerCargoDocumentsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct EmployerCargoDocumentsView: View {
    @ObservedObject var cargoViewModel: EmployerCargoViewModel
    @State private var isApproveTapped = false
    
    var body: some View {
        VStack {
            if cargoViewModel.documents.isEmpty {
                Text("No attached documents for this cargo")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .font(.system(size: 16))
            } else {
                List {
                    ForEach(Array(cargoViewModel.documents), id: \.self) { url in
                        Text(url.lastPathComponent)
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button(role: .destructive) {
                                    cargoViewModel.removeDocument(with: url)
                                } label: {
                                    Image(systemName: "trash.fill")
                                }
                            }
                    }
                    .listRowBackground(Color.component)
                }
                .scrollContentBackground(.hidden)
                Button(action: {
                    cargoViewModel.approveDocuments()
                    withAnimation {
                        isApproveTapped = true
                    }
                }) {
                    Text("Approve")
                        .frame(width: 320, height: 38)
                        .modifier(
                            ButtonStyleModifier(
                                background: .button,
                                foreground: .buttonText
                            )
                        )
                }
            }
        }
        .navigationTitle("Documents")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.background)
        .toolbarBackground(.thinMaterial, for: .navigationBar)
        .hud($isApproveTapped, "Documents approved")
    }
}

#Preview {
    NavigationView {
        EmployerCargoDocumentsView(cargoViewModel: EmployerCargoViewModel())
    }
}
