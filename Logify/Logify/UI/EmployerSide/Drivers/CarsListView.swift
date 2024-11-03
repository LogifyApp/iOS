//
//  CarListView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/11/2024.
//

import SwiftUI

struct CarsListView: View {
    @ObservedObject var viewModel: CarsListViewModel
    @Binding var isTabViewPresented: Bool
    
    var body: some View {
        if viewModel.cars.isEmpty {
            Text("Cars list is empty")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .font(.subheadline)
        } else {
            ScrollView {
                ForEach(viewModel.cars, id: \.plate) { car in
                    NavigationLink {
                        
                    } label: {
                        Text("car")
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

#Preview {
    CarsListView(
        viewModel: CarsListViewModel(),
        isTabViewPresented: .constant(false)
    )
}
