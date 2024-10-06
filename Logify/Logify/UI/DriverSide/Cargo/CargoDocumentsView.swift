//
//  CargoDocumentsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 06/09/2024.
//

import SwiftUI

struct CargoDocumentsView: View {
    
    @ObservedObject var cargoViewModel: CargoViewModel
    @State private var showImporter = false
    
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
            }
        }
        .navigationTitle("Documents")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.background)
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
                            cargoViewModel.addDocument(with: url)
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
        CargoDocumentsView(cargoViewModel: CargoViewModel())
    }
}
