//
//  ActiveEmployerRow.swift
//  Logify
//
//  Created by Vlad Klunduk on 08/08/2024.
//

import SwiftUI

struct ActiveEmployerRow: View {
    
    var employer: Employer
    
    var body: some View {
        HStack {
            Image("user")
                .resizable()
                .frame(width: 70, height: 70, alignment: .center)
                .padding(.horizontal, 8)
            
            VStack(alignment: .leading) {
                Text(employer.name)
                    .font(Font.system(size: 18))
                    .bold()
                Text(employer.surname)
                    .font(Font.system(size: 18))
                    .bold()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    ActiveEmployerRow(employer: Employer(id: 0, name: "Name", surname: "Surname", phoneNumber: 381475456, password: "owubr", role: "", drivers: []))
        .frame(height: 300)
}
