import SwiftUI
import SwiftfulUI

struct BumbleCardView: View {
    
    var user: User = .mock
    @State private var cardFrame: CGRect = .zero
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                headerCell
                    .frame(height: cardFrame.height)
            }
        }
        .scrollIndicators(.hidden)
        .cornerRadius(32)
        .readingFrame { frame in
            cardFrame = frame
        }
    }
    
    var headerCell: some View {
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
                BumbleCardView()
                    .onTapGesture {
                        print("111")
                    }
            }
            .padding(24)
            .font(.callout)
            .fontWeight(.medium)
            .foregroundStyle(.bumbleWhite)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                LinearGradient(
                    colors: [
                        .bumbleBlack.opacity(0),
                        .bumbleBlack.opacity(0.6),
                        .bumbleBlack.opacity(0.6)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
    }
}

#Preview {
    BumbleCardView()
        .padding(.vertical, 40)
        .padding(.horizontal, 16)
}
