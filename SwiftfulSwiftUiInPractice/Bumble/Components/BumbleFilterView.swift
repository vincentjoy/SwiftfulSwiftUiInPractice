import SwiftUI

struct BumbleFilterView: View {
    
    var options: [String] = ["Everyone", "Trending"]
    @Binding var selection: String
    @Namespace private var nameSpace
    
    var body: some View {
        HStack(alignment: .top, spacing: 32) {
            ForEach(options, id: \.self) { option in
                VStack(spacing: 8) {
                    Text(option)
                        .frame(maxWidth: .infinity)
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    if selection == option {
                        RoundedRectangle(cornerRadius: 2)
                            .frame(height: 1.5)
                            .matchedGeometryEffect(id: "selection", in: nameSpace)
                    }
                }
                .padding(.top, 8)
                .background(Color.black.opacity(0.001))
                .foregroundStyle((selection == option) ? .bumbleBlack : .bumbleGray)
                .onTapGesture {
                    selection = option
                }
            }
        }
        .animation(.smooth, value: selection)
    }
}

#Preview {
    BumbleFilterView()
        .padding()
}
