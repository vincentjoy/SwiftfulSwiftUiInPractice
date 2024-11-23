import SwiftUI

struct SpotifyPlayListView: View {
    
    var product: Product = Product.mock
    
    var body: some View {
        Color.spotifyBlack.ignoresSafeArea()
        ScrollView(.vertical) {
            PlayListHeaderCell(
                height: 250,
                title: product.title,
                subtitle: product.brand ?? "NA",
                imageName: product.thumbnail
            )
        }
    }
}

#Preview {
    SpotifyPlayListView()
}
