//
//  ViewPicker.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/11/2024.
//

import SwiftUI

struct DeliveryView: View {
    @State private var selectedView = 0
    @State private var isPlusTapped = false
    @Binding var isTabViewPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                if selectedView == 0 {
                    EmployerDriversListView(
                        viewModel: EmployerDriversListViewModel(),
                        isTabViewPresented: $isTabViewPresented
                    )
                } else {
                    CarsListView(
                        viewModel: CarsListViewModel(),
                        isTabViewPresented: $isTabViewPresented
                    )
                }
            }
            .padding(.top)
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.thinMaterial, for: .navigationBar)
            .toolbarBackground(.hidden, for: .tabBar)
            .toolbar(isTabViewPresented ? .visible : .hidden, for: .tabBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Picker("", selection: $selectedView) {
                        Text("Drivers")
                            .tag(0)
                        Text("Cars")
                            .tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 200)
                }
                ToolbarItem {
                    Button("", systemImage: "plus") {
                        
                    }
                }
            }
            .onAppear {
                withAnimation {
                    isTabViewPresented = true
                }
            }
            .fullScreenCover(isPresented: $isPlusTapped) {
                
            }
        }
    }
}

#Preview {
    NavigationView {
        DeliveryView(isTabViewPresented: .constant(false))
    }
}
