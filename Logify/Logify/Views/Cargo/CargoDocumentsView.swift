//
//  CargoDocumentsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 06/09/2024.
//

import SwiftUI

struct CargoDocumentsView: View {
    
    @State private var showImporter = false
    @State private var files = Set<URL>()
    
    var body: some View {
        VStack {
            if files.isEmpty {
                Text("No attached documents for this cargo")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .font(.system(size: 16))
            } else {
                List {
                    ForEach(Array(files), id: \.self) { url in
                        Text(url.lastPathComponent)
                            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                Button(role: .destructive) {
                                    files.remove(url)
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
                Button(action: { showImporter.toggle() }) {
                    Image(systemName: "plus")
                }
                .fileImporter(isPresented: $showImporter,
                              allowedContentTypes: [.data],
                              allowsMultipleSelection: true) { results in
                    switch(results) {
                    case .success(let urls):
                        urls.forEach { url in
                            files.insert(url)
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
        CargoDocumentsView()
    }
}
