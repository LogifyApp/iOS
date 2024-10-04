//
//  PointsSelectionView.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import SwiftUI

struct RouteCreationView: View {
    @EnvironmentObject var newCargoViewModel: NewCargoViewModel
    @State private var showNewPointView = false
    
    var body: some View {
        List {
            Section {
                if newCargoViewModel.points.isEmpty {
                    Text("Route doesn't have points")
                        .frame(maxWidth: .infinity)
                        .font(.subheadline)
                        .padding(.vertical)
                } else {
                    List {
                        ForEach(newCargoViewModel.points, id: \.id) { point in
                            VStack {
                                Text(point.label)
                                Text(point.getCoordinates())
                                    .font(.subheadline)
                            }
                        }
                    }
                }
                Button("Add point") {
                    showNewPointView.toggle()
                }
            }
        }
        .background(Color.background)
        .scrollContentBackground(.hidden)
        .navigationTitle("Route")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showNewPointView) {
            NewPointView()
        }
    }
}

#Preview {
    NavigationView {
        RouteCreationView()
            .environmentObject(NewCargoViewModel())
    }
}
