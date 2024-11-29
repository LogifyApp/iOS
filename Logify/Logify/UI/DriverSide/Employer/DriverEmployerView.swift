//
//  DirverEmployerView.swift
//  Logify
//
//  Created by Vlad Klunduk on 25/10/2024.
//

import SwiftUI

struct DriverEmployerView: View {
    @ObservedObject var viewModel: EmployersViewModel
    @Binding var isTabViewPresented: Bool
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    if let employer = viewModel.employer {
                        UserDataCell(user: employer)
                            .padding(20)
                    } else {
                        Text("You don't have active employer")
                            .frame(maxWidth: .infinity, minHeight: 100)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(Color.component)
                            }
                            .padding(20)
                    }
                    List {
                        Section {
                            if viewModel.employersRequests.isEmpty {
                                Text("You don't have active requests")
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 30)
                            } else {
                                ForEach(viewModel.employersRequests, id: \.id){ employer in
                                    NavigationLink {
                                        EmployerRequestDetailsView(
                                            isTabViewPresented: $isTabViewPresented,
                                            employer: employer
                                        )
                                    } label: {
                                        Text(employer.getFullName())
                                    }
                                }
                            }
                        } header: {
                            SectionHeader(text: "Requests")
                        }
                        .listRowBackground(Color.component)
                    }
                    .frame(minHeight: 80*CGFloat(viewModel.employersRequests.count))
                    .scrollContentBackground(.hidden)
                    .scrollDisabled(true)
                }
            }
            .navigationTitle("Employer")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.background)
            .toolbarBackground(.thinMaterial, for: .navigationBar)
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
        DriverEmployerView(
            viewModel: EmployersViewModel(),
            isTabViewPresented: .constant(true)
        )
    }
}
