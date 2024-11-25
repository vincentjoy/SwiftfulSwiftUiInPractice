import SwiftUI

struct BumbleCardView: View {
    
    var user: User = .mock
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    ImageLoaderView(urlString: user.image)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("\(user.firstName), \(user.age)")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        HStack(spacing: 4) {
                            Image(systemName: "suitcase")
                            Text("Works at \(user.work)")
                        }
                        HStack(spacing: 4) {
                            Image(systemName: "graduationcap")
                            Text(user.work)
                        }
                    }
                    .padding(24)
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(.bumbleWhite)
                }
                .frame(height: 600)
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    BumbleCardView()
        .padding(.vertical, 40)
        .padding(.horizontal, 16)
}
