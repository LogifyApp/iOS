//
//  NewPointMapView.swift
//  Logify
//
//  Created by Vlad Klunduk on 04/10/2024.
//

import SwiftUI
import MapKit

struct PointCreationMapView: View {
    @Environment(\.dismiss) var dismiss
    @State private var position = MapCameraPosition.automatic
    @State private var point = MKMapPoint()
    @Binding var coordinates: String
    
    var body: some View {
        ZStack {
            Map(position: $position) {
                UserAnnotation()
            }
            .mapControls {
                MapUserLocationButton()
            }
            .onMapCameraChange(frequency: .continuous) { context in
                point = MKMapPoint(
                    x: context.rect.midX,
                    y: context.rect.midY
                )
            }
            .safeAreaInset(edge: .bottom) {
                Button {
                    coordinates = "\(point.coordinate.latitude) \(point.coordinate.longitude)"
                    dismiss()
                } label: {
                    Text("Select")
                        .frame(width: 150, height: 40)
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
            Image(systemName: "mappin")
                .resizable()
                .frame(width: 10, height: 30)
                .foregroundStyle(.red)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.thinMaterial, for: .navigationBar)
    }
}

#Preview {
    NavigationView {
        PointCreationMapView(coordinates: .constant(""))
    }
}
