import SwiftUI

struct SpotifyPlayListView: View {
    
    var product: Product = .mock
    var user: User = .mock
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    PlayListHeaderCell(
                        height: 250,
                        title: product.title,
                        subtitle: product.brand ?? "NA",
                        imageName: product.thumbnail
                    )
                    PlaylistDescriptionFile(
                        descriptionText: product.description,
                        userName: user.firstName,
                        subheadline: product.category.rawValue,
                        onAddToPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onSharePressed: nil,
                        onEllipsisPressed: nil,
                        onShufflePressed: nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal, 16)
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    SpotifyPlayListView()
}
