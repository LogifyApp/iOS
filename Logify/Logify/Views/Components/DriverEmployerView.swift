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
                    VStack {
                        HStack {
                            Image("user")
                                .resizable()
                                .frame(width: 70, height: 70, alignment: .center)
                                .padding(.horizontal, 8)
                            
                            VStack(alignment: .leading) {
                                Text("Name")
                                    .font(Font.system(size: 18))
                                    .bold()
                                Text("Surname")
                                    .font(Font.system(size: 18))
                                    .bold()
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Button(action: {}, label: {
                                Image(systemName: "trash.circle")
                                    .resizable()
                                    .frame(width: 26, height: 26)
                                    .foregroundStyle(.red)
                                    .frame(
                                        maxHeight: .infinity,
                                        alignment: .topTrailing)
                            })
                        }
                        .frame(maxHeight: 80)
                        
                        Button(action: {}, label: {
                            ButtonLabel(text: "Chat", width: 320, height: 34, background: .black, foreground: .white)
                        })
                    }
                    .padding(6)
                } header: {
                    Text("Employer")
                        .foregroundStyle(.black)
                        .font(.headline)
                        .textCase(.none)
                }

                Section {
                    ForEach(0..<10){ index in
                        EmployerRequestRow()
                    }
                } header: {
                    Text("Requests")
                        .foregroundStyle(.black)
                        .font(.headline)
                        .textCase(.none)
                }
            }
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    DriverEmployerView()
}
