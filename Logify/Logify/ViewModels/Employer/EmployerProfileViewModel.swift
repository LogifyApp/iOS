//
//  EmployerProfileViewModel.swift
//  Logify
//
//  Created by Vlad Klunduk on 03/10/2024.
//

import Foundation
class EmployerProfileViewModel: ObservableObject {
    @Published var employer: Employer
    
    init(employer: Employer) {
        self.employer = employer
    }
    
    init() {
        self.employer = Employer(id: 2, name: "Name", surname: "Surname", phoneNumber: 1234535345, password: "", role: "Employer")
    }
}
