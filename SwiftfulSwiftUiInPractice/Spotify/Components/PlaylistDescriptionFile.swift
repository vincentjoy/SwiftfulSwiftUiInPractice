import SwiftUI

struct PlaylistDescriptionFile: View {
    
    var descriptionText: String = Product.mock.description
    var userName: String = "Nick"
    var subheadline: String = "This is a description of the playlist"
    var onAddToPlaylistPressed: (() -> Void)?
    var onDownloadPressed: (() -> Void)?
    var onSharePressed: (() -> Void)?
    var onEllipsisPressed: (() -> Void)?
    var onShufflePressed: (() -> Void)?
    var onPlayPressed: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(descriptionText)
                .foregroundColor(.spotifyLightGray)
                .frame(maxWidth: .infinity, alignment: .leading)
            madeForYouSection
            Text(subheadline)
        }
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(.spotifyLightGray)
    }
    
    private var madeForYouSection: some View {
        HStack {
            Image(systemName: "applelogo")
                .font(.title3)
                .foregroundStyle(.spotifyGreen)
            Text("Made for ")
            +
            Text(userName)
                .bold()
                .foregroundStyle(.spotifyWhite)
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        PlaylistDescriptionFile()
            .padding()
    }
}
