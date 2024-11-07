//
//  NewCarDetailsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 04/11/2024.
//

import SwiftUI

struct CarCreationView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = CarCreationViewModel()
    @State private var isReturnConfirmationPresented = false
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Text("Plate")
                    TextField("", text: $viewModel.plate, prompt: Text("Number"))
                        .multilineTextAlignment(.trailing)
                }
                Section {
                    Picker("Brand", selection: $viewModel.brand) {
                        ForEach(readJson(), id: \.self) { brand in
                            Text(brand)
                        }
                    }
                    .pickerStyle(NavigationLinkPickerStyle())
                    HStack {
                        Text("Model")
                        TextField("", text: $viewModel.model, prompt: Text("Name"))
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
            .navigationTitle("New car")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.background)
            .scrollContentBackground(.hidden)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Return") {
                        isReturnConfirmationPresented = true
                    }
                }
            }
            .confirmationDialog("Return", isPresented: $isReturnConfirmationPresented) {
                Button("Return", role: .destructive) {
                    dismiss()
                }
            } message: {
                Text("Are you sure you want to return?")
            }
        }
    }
    
    func readJson() -> [String] {
        guard let url = Bundle.main.url(forResource: "car_brands", withExtension: "json") else {
            return []
        }
        do {
            let data = try Data(contentsOf: url)
            let list = try JSONDecoder().decode([String].self, from: data)
            return list
        } catch {
            print(error)
        }
        return []
    }
}

#Preview {
    CarCreationView()
}
