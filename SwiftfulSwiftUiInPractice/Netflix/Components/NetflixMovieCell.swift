import SwiftUI

struct NetflixMovieCell: View {
    
    var width: CGFloat = 90
    var height: CGFloat = 140
    var imageName: String = Constants.randomImageURL
    var title: String? = "Movie Title"
    var isRecentlyAdded: Bool = true
    var topTenRanking: Int?
    
    var body: some View {
        HStack(alignment: .bottom, spacing: -8) {
            if let topTenRanking {
                Text("\(topTenRanking)")
                    .font(.system(size: 100, weight: .medium, design: .serif))
                    .offset(y: 20)
            }
    
            ZStack(alignment: .bottom) {
                ImageLoaderView(urlString: imageName)
                VStack(spacing: 0) {
                    if let title,
                        let firstWord = title.components(separatedBy: " ").first {
                        Text(firstWord)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .lineLimit(1)
                    }
                    Text("Recently Added")
                        .padding(.horizontal, 4)
                        .padding(.vertical, 2)
                        .padding(.bottom, 2)
                        .frame(maxWidth: .infinity)
                        .background(.netflixRed)
                        .cornerRadius(2)
                        .offset(y: 2)
                        .lineLimit(1)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .minimumScaleFactor(0.1)
                        .padding(.horizontal, 8)
                        .opacity(isRecentlyAdded ? 1 : 0)
                }
                .padding(.top, 6)
                .background(
                    LinearGradient(
                        colors: [
                            .netflixBlack.opacity(0),
                            .netflixBlack.opacity(0.3),
                            .netflixBlack.opacity(0.4),
                            .netflixBlack.opacity(0.4)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
            .cornerRadius(4)
            .frame(width: width, height: height)
        }
        .foregroundStyle(.netflixWhite)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ScrollView {
            VStack {
                NetflixMovieCell(isRecentlyAdded: false)
                NetflixMovieCell()
                NetflixMovieCell(topTenRanking: 1)
                NetflixMovieCell(topTenRanking: 6)
                NetflixMovieCell(topTenRanking: 10)
            }
        }
    }
}
