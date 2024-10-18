//
//  PointsSelectionView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct RouteEditingView: View {
    @EnvironmentObject var newCargoViewModel: NewCargoViewModel
    @State private var d: [Point] = [
        Point(id: 1, label: "Point 1", latitude: 52.219420, longtitude: 20.983114, order: 0, cargoId: 1),
        Point(id: 2, label: "Point 2", latitude: 52.219420, longtitude: 20.983114, order: 0, cargoId: 1),
        Point(id: 3, label: "Point 3", latitude: 52.219420, longtitude: 20.983114, order: 0, cargoId: 1)
    ]
    
    var body: some View {
        List {
            ForEach (d, id: \.id) { point in
                Text(point.label)
            }
            .onDelete { indexSet in
                d.remove(atOffsets: indexSet)
            }
            .onMove { indices, newOffset in
                d.move(
                    fromOffsets: indices,
                    toOffset: newOffset
                )
            }
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
            .environmentObject(NewCargoViewModel())
    }
}
