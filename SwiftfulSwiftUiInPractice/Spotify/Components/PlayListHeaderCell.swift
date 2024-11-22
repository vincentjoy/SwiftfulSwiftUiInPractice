import SwiftUI
import SwiftfulUI

struct PlayListHeaderCell: View {
    
    var height: CGFloat = 300
    var title: String = "Play List Header"
    var subtitle: String = "Subtitle goes here"
    var imageName: String = Constants.randomImageURL
    var shadowColor: Color = .spotifyBlack.opacity(0.8)
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay {
                ImageLoaderView(urlString: imageName)
            }
            .overlay(alignment: .bottom, content: {
                VStack(alignment: .leading, spacing: 8) {
                    Text(subtitle)
                        .font(.headline)
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    LinearGradient(gradient: Gradient(colors: [shadowColor.opacity(0), shadowColor]), startPoint: .top, endPoint: .bottom)
                )
            })
            .asStretchyHeader(startingHeight: height)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ScrollView {
            PlayListHeaderCell()
        }
        .ignoresSafeArea()
    }
}
