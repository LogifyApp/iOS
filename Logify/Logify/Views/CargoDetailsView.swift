//
//  CargoDetailsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 22/08/2024.
//

import SwiftUI

struct CargoDetailsView: View {
    
    var bcolor: Color = .blue
    
    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
            List {
                // MARK: Details
                Section {
                    CargoDetailsCell(property: "Cargo ID", value: "028493")
                    CargoDetailsCell(property: "Status", value: "Created")
                    CargoDetailsCell(property: "Creation date", value: "12.12.2012")
                    CargoDetailsCell(property: "Car ID", value: "028493")
                }
                
                // MARK: Description
                Section {
                    Text("g37yfrhuji90ktivgr9-jfhbduho cemkirojhuubfjtnv emcdkoiujrhb rjntverm dkoijcfuehrb nmvkrodjicuehrbf nmkgtvf,orgidjucehnrdnj")
                }

                // MARK: Route
                Section {
                    VStack(spacing: 0) {
                        CargoRouteRegularCell(
                            name: "Mokotow street",
                            coordinates: "23.43453545 54.23456789",
                            isLast: false)
                        
                        CargoRouteRegularCell(
                            name: "Wola street",
                            coordinates: "23.43453545 54.23456789",
                            isLast: false)
                        
                        CargoRouteRegularCell(
                            name: "Bemowo street",
                            coordinates: "23.43453545 54.23456789",
                            isLast: true)
                        
                        Button(action: {}, label: {
                            HStack {
                                Image(systemName: "map")
                                Text("Map")
                            }
                            .modifier(ButtonModifier(width: 310, height: 36, background: .black, foreground: .white))
                        })
                        .padding(.bottom, 8)
                        .padding(.top, -8)
                    }
                }
            }
            .scrollContentBackground(.hidden)
        }
        .navigationTitle("Details")
        .toolbarTitleDisplayMode(.inline)
    }
}


#Preview {
    CargoDetailsView()
}



struct CargoDetailsCell: View {
    
    let property: String
    let value: String
    
    var body: some View {
        HStack {
            Text(property)
                .foregroundStyle(.secondary)
            Spacer()
            Text(value)
        }
    }
}

struct CargoRouteRegularCell: View {
    
    let name: String
    let coordinates: String
    let isLast: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "circle.dashed")
                .foregroundStyle(.blue)
            Text(name)
                .font(.system(size: 18))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 8)
        
        HStack {
            VStack() {
                if isLast {
                    Image(systemName: "chevron.down")
                        .foregroundStyle(.clear)
                        
                } else {
                    Image(systemName: "chevron.down")
                        .foregroundStyle(.blue)
                    Image(systemName: "chevron.down")
                        .foregroundStyle(.blue)
                }
            }
            .padding(.vertical)
            
            HStack {
                //Image(systemName: "mappin")
                Text(coordinates)
                    .font(.system(size: 16))
                Button(action: {}, label: {
                    Image(systemName: "rectangle.portrait.on.rectangle.portrait")
                })
                .buttonStyle(PlainButtonStyle())
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}
