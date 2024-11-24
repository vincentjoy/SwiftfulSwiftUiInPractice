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
                aboutMeSection
                    .padding(.horizontal, 24)
                    .padding(.vertical, 24)
                myInterestsSection
                    .padding(.horizontal, 24)
                    .padding(.vertical, 24)
            }
        }
        .scrollIndicators(.hidden)
        .background(.bumbleBackgroundYellow)
        .cornerRadius(32)
        .readingFrame { frame in
            cardFrame = frame
        }
    }
    
    private func sectionTitle(title: String) -> some View {
        Text(title)
            .font(.body)
            .foregroundStyle(.bumbleGray)
    }
    
    private var headerCell: some View {
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
    
    private var aboutMeSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionTitle(title: "About Me")
            Text(user.aboutMe)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundStyle(.bumbleBlack)
            HStack(spacing: 0) {
                BumbleHeartView()
                Text("Send a compliment")
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            .padding([.horizontal, .trailing], 8)
            .background(.bumbleYellow)
            .cornerRadius(32)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var myInterestsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 8) {
                sectionTitle(title: "My Basics")
                InterestPillGridView(interests: user.basics)
            }
            VStack(alignment: .leading, spacing: 8) {
                sectionTitle(title: "My Interests")
                InterestPillGridView(interests: user.interests)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    BumbleCardView()
        .padding(.vertical, 40)
        .padding(.horizontal, 16)
}
