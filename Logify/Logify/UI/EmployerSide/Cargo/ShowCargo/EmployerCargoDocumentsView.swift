//
//  EmployerCargoDocumentsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct EmployerCargoDocumentsView: View {
    @ObservedObject var viewModel: EmployerCargoDocumentsViewModel
    @State private var isApproveTapped = false
    
    var body: some View {
        VStack {
            if viewModel.documents.isEmpty {
                Text("No attached documents for this cargo")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .font(.system(size: 16))
            } else {
                List {
                    ForEach(Array(viewModel.documents), id: \.self) { url in
                        Text(url.lastPathComponent)
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button(role: .destructive) {
                                    viewModel.removeDocument(with: url)
                                } label: {
                                    Image(systemName: "trash.fill")
                                }
                            }
                    }
                }
                .scrollContentBackground(.hidden)
                Button(action: {
                    viewModel.approveDocuments()
                    withAnimation {
                        isApproveTapped = true
                    }
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
        .hud($isApproveTapped, "Documents approved")
    }
}

#Preview {
    NavigationView {
        EmployerCargoDocumentsView(
            viewModel: EmployerCargoDocumentsViewModel(
                coordinator: EmployerCargoCoordinator(),
                cargoId: 1
            )
        )
    }
}
