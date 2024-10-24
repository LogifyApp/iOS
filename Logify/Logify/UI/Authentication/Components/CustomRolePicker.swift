import SwiftUI

struct CustomRolePicker: View {
    @Binding var selection: Role
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Role.allCases, id: \.self) { role in
                Button {
                    selection = role
                } label: {
                    Text(role.rawValue)
                        .foregroundStyle(selection == role ? .white : .black)
                }
                .buttonStyle(PlainButtonStyle())
                .frame(width: 160, height: 38)
                .background {
                    Capsule()
                        .foregroundStyle(selection == role ? .black : .clear)
                }
            }
        }
        .background(.white)
        .clipShape(Capsule())
        .overlay(Capsule().stroke(.gray, lineWidth: 0.4))
        .animation(.bouncy, value: selection)
    }
}

#Preview {
    CustomRolePicker(selection: .constant(Role.driver))
}
