//
//  CargoDetailsView.swift
//  Logify
//
//  Created by Vlad Klunduk on 22/08/2024.
//

import SwiftUI

struct CargoDetailsView: View {
    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
            List {
                Section {
                    HStack {
                        Text("Cargo id")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("              028493")
                    }
                    
                    HStack {
                        Text("Status")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("                  Created")
                    }
                    
                    HStack {
                        Text("Creation date")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("     12.23.1342")
                    }
                    
                    HStack {
                        Text("Car id")
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("                   23083")
                    }
                }
                
                Section {
                    Text("oemvtijebyegmrvk,fclddcfv vbromv,ofdo,fciermtgi rvgf dcofsvegrmbihtigfdcfprektoigomjr vf,doc frmetkrmog dhgunrvijmfceok,bhuvnrijmgok,fecdvfgbyuhnijmobtgrvfecdsfvygbuhnijmokbhtgrvfdghnjmk,bgrvfd")
                }
                
                Section {
                    
                }
            }
            .scrollContentBackground(.hidden)
        }
        .navigationTitle("Cargo details")
        .toolbarTitleDisplayMode(.inline)
    }
}



#Preview {
    CargoDetailsView()
}
