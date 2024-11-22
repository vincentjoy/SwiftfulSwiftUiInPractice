import SwiftUI
import SwiftfulUI

struct SpotifyHomeView: View {
    
    @State private var currentUser: User?
    @State private var selectedCategory: Category?
    @State private var products: [Product] = []
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical) {
                LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders]) {
                    Section {
                        VStack(spacing: 16) {
                            RecentsSection
                            if let firstProduct = products.first {
                                getNewReleaseCell(firstProduct: firstProduct)
                            }
                            getImageTitleRowCell("Category Title")
                        }
                        .padding(.horizontal, 16)
                    } header: {
                        Header
                    }

                }
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        .task {
            await getData()
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
    
    private var Header: some View {
        HStack(spacing: 0) {
            ZStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            print("User profile icon tapped")
                        }
                }
            }
            .frame(width: 35, height: 35)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected:( category == selectedCategory)
                        )
                        .onTapGesture {
                            selectedCategory = category
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
    
    private var RecentsSection: some View {
        NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: products) { product in
            if let product {
                SpotifyRecentsCell(
                    imageUrlString: product.firstImage,
                    title: product.title)
            }
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
                print("11")
            }
    }
    
    private func getImageTitleRowCell(_ title: String) -> some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.spotifyWhite)
                .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<20) { _ in
                        ImageTitleRowCell()
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
    
    private func getData() async {
        do {
            currentUser = try await DataBaseHelper().getUsers().first
            products = try await Array(DataBaseHelper().getProducts().prefix(8))
        } catch {
            
        }
    }
}

#Preview {
    SpotifyHomeView()
}
