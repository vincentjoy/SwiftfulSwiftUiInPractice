import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct SpotifyHomeView: View {
    
    @State var viewModel: SpotifyHomeViewModel
    @Environment(\.router) var router
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders]) {
                    Section {
                        VStack(spacing: 16) {
                            recentsSection
                                .padding(.horizontal, 16)
                            if let firstProduct = viewModel.products.first {
                                getNewReleaseCell(firstProduct: firstProduct)
                                    .padding(.horizontal, 16)
                            }
                            listRows
                        }
                    } header: {
                        header
                    }

                }
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        .task {
            await viewModel.getData()
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            ZStack {
                if let currentUser = viewModel.currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            router.dismissScreen()
                        }
                }
            }
            .frame(width: 35, height: 35)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected:( category == viewModel.selectedCategory)
                        )
                        .onTapGesture {
                            viewModel.selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .background(.spotifyBlack)
    }
    
    private var recentsSection: some View {
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: viewModel.products) { product in
            if let product {
                SpotifyRecentsCell(
                    imageUrlString: product.firstImage,
                    title: product.title
                )
                .asButton(.press) {
                    goToPlaylistView(product: product)
                }
            }
        }
    }
    
    private func goToPlaylistView(product: Product) {
        guard let currentUser = viewModel.currentUser else { return }
        router.showScreen(.push) { _ in
            SpotifyPlayListView(product: product, user: currentUser)
        }
    }
    
    private func getNewReleaseCell(firstProduct: Product) -> some View {
        SpotifyNewReleaseCell(
            imageName: firstProduct.firstImage,
            headline: firstProduct.brand,
            subheadline: firstProduct.category.rawValue,
            title: firstProduct.title,
            subtitle: firstProduct.description) {
                print("11")
            } onPlayPressed: {
                goToPlaylistView(product: firstProduct)
            }
    }
    
    private var listRows: some View {
        ForEach(viewModel.productRows) { row in
            VStack(spacing: 8) {
                Text(row.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.spotifyWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing: 16) {
                        ForEach(row.products) { product in
                            ImageTitleRowCell(imageSize: 120,
                                              imageName: product.firstImage,
                                              title: product.title
                            )
                            .asButton(.press) {
                                goToPlaylistView(product: product)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    RouterView { router in
        SpotifyHomeView(viewModel: SpotifyHomeViewModel(router: router))
    }
}
