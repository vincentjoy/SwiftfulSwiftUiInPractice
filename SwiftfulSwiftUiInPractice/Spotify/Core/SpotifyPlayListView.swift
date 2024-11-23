import SwiftUI

struct SpotifyPlayListView: View {
    
    var product: Product = .mock
    var user: User = .mock
    
    @State private var products: [Product] = []
    
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
                    
                    ForEach(products) { product in
                        SongRowCell(
                            imageSize: 60,
                            imageName: product.firstImage,
                            title: product.title,
                            subtitle: product.brand) {
                                
                            } onEllipsisPressed: {
                                
                            }
                            .padding(.leading, 16)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do {
            products = try await DataBaseHelper().getProducts()
        } catch {
            
        }
    }
}

#Preview {
    SpotifyPlayListView()
}
