//
//  ContentView.swift
//  Logify
//
//  Created by Vlad Klunduk on 19/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedItem = 0 
    
    var body: some View { 
        TabView(selection: $selectedItem) {
            DriverCargoView(cargo: [
                Cargo(id: 137287897,
                      description: "iaybdcuwybec",
                      status: "Created",
                      creationDate: Date.now,
                      carId: "24987",
                      points: [
                        Point(id: 0, label: "start", latitude: 52.219420, longtitude: 20.983114, order: 0),
                        Point(id: 2, label: "mokotow", latitude: 52.240238, longtitude: 21.018649, order: 0),
                        Point(id: 3, label: "wola", latitude: 52.260238, longtitude: 21.038649, order: 0),
                        Point(id: 4, label: "bemovo", latitude: 52.220238, longtitude: 20.95649, order: 0)
                        ]
                      ),
                Cargo(id: 256365346,
                      description: "iaybdcuwybec",
                      status: "Created",
                      creationDate: Date.now,
                      carId: "24987",
                      points: [
                        Point(id: 0,
                              label: "kubsirv wjw r krju",
                              latitude: 238642,
                              longtitude: 2453534,
                              order: 1456343),
                        Point(id: 1,
                              label: "kubsirv wjw r krju",
                              latitude: 238642,
                              longtitude: 2453534,
                              order: 1456343)
                      ])
            ])
                .tag(0)
            DriverChatView()
                .tag(1)
            DriverProfileView()
                .tag(2)
        }
        .overlay(alignment: .bottom) {
            CustomTabView(selectedItem: $selectedItem)
        }.ignoresSafeArea()        
    }
}

#Preview {
    ContentView()
}
