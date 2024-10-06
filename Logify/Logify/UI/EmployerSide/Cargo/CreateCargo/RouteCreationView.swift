//
//  PointsSelectionView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct RouteCreationView: View {
    @EnvironmentObject var newCargoViewModel: NewCargoViewModel
    
    var body: some View {
        if newCargoViewModel.points.isEmpty {
            Text("Route doesn't have points")
                .frame(maxWidth: .infinity)
                .font(.subheadline)
                .padding(.vertical)
        } else {
            List {
                ForEach (newCargoViewModel.points, id: \.id) { point in
                    Text(point.label)
                }
            }
            .background(Color.background)
            .scrollContentBackground(.hidden)
            .navigationTitle("Route")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    NavigationStack {
        RouteCreationView()
            .environmentObject(NewCargoViewModel())
    }
}
