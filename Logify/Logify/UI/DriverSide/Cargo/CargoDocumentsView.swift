//
//  CargoDocumentsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 06/09/2024.
//

import SwiftUI

struct CargoDocumentsView: View {
    @ObservedObject var viewModel: CargoViewModel
    @State private var showImporter = false
    
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
            }
        }
        .navigationTitle("Documents")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.background)
        .toolbarBackground(.thinMaterial, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showImporter.toggle()
                } label: {
                    Image(systemName: "plus")
                }
                .fileImporter(isPresented: $showImporter,
                              allowedContentTypes: [.data],
                              allowsMultipleSelection: true) { results in
                    switch(results) {
                    case .success(let urls):
                        urls.forEach { url in
                            viewModel.addDocument(with: url)
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        CargoDocumentsView(viewModel: CargoViewModel())
    }
}
