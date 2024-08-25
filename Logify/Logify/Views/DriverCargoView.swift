//
//  DriversCargoView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/07/2024.
//

import SwiftUI

struct DriverCargoView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color.background
                    .ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(0..<30) { number in
                            NavigationLink(destination: CargoDetailsView()) {
                                CargoCell()
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .navigationTitle("Cargo")
            .toolbarTitleDisplayMode(.inline)
            .toolbarBackground(.hidden, for: .tabBar)
            .toolbarBackground(Color.background, for: .navigationBar)
        }
        .searchable(text: .constant(""), placement: .navigationBarDrawer(displayMode: .always))
    }
}

#Preview {
    DriverCargoView()
}
