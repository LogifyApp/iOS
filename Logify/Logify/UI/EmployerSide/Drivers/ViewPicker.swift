//
//  ViewPicker.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/11/2024.
//

import SwiftUI

struct ViewPicker: View {
    @State private var selectedView = 0
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
                    
                }
            }
            .background(Color.background)
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
                }
            }
            .onAppear {
                withAnimation {
                    isTabViewPresented = true
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        ViewPicker(isTabViewPresented: .constant(false))
    }
}
