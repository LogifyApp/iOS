//
//  DriverProfileEmployerView.swift
//  Logify
//
//  Created by Vlad Klunduk on 27/07/2024.
//

import SwiftUI

struct DriverEmployerView: View {
    
    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
            Form {
                Section {
                    /*Text("There is no active employer")
                        .padding(.vertical)*/
                    ActiveEmployerRow()
                    .padding(6)
                } header: {
                    SectionHeader(text: "Employer")
                }

                Section {
                    /*Text("There is no active requests")
                        .padding(.vertical)*/
                    ForEach(0..<10){ index in
                        RequestEmployerRow()
                    }
                } header: {
                    SectionHeader(text: "Requests")
                }
            }
            .scrollContentBackground(.hidden)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DriverEmployerView()
}
