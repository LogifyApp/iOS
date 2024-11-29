//
//  PointsSelectionView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct RouteEditingView: View {
    @EnvironmentObject var viewModel: CargoCreationViewModel
    
    var body: some View {
        List {
            ForEach (viewModel.points, id: \.id) { point in
                Text(point.label)
            }
            .onDelete { indexSet in
                viewModel.points.remove(atOffsets: indexSet)
            }
            .onMove { indices, newOffset in
                viewModel.points.move(
                    fromOffsets: indices,
                    toOffset: newOffset
                )
            }
            .listRowBackground(Color.component)
        }
        .navigationTitle("Route")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.background)
        .scrollContentBackground(.hidden)
        .toolbarBackground(.thinMaterial, for: .navigationBar)
        .environment(\.editMode, .constant(.active))
    }
}

#Preview {
    NavigationStack {
        RouteEditingView()
            .environmentObject(CargoCreationViewModel())
    }
}
