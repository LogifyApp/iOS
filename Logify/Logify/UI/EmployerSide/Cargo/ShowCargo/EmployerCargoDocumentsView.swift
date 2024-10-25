//
//  EmployerCargoDocumentsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct EmployerCargoDocumentsView: View {
    @ObservedObject var cargoViewModel: EmployerCargoViewModel
    
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
                }
                .scrollContentBackground(.hidden)
                Button(action: {
                    cargoViewModel.approveDocuments()
                }) {
                    Text("Approve")
                        .frame(width: 320, height: 38)
                        .modifier(
                            ButtonStyleModifier(
                                background: .black,
                                foreground: .white
                            )
                        )
                }
            }
        }
        .navigationTitle("Documents")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.background)
        .toolbarBackground(.thinMaterial, for: .navigationBar)
    }
}

#Preview {
    NavigationView {
        EmployerCargoDocumentsView(cargoViewModel: EmployerCargoViewModel())
    }
}
