import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct NetflixHomeView: View {
    
    @Environment(\.router) private var router
    
    @State private var filters = FilterModel.mockArray
    @State private var selectedFilter: FilterModel?
    @State private var fullHeaderSize: CGSize = .zero
    @State private var scrollViewOffset: CGFloat = 0
    @State private var heroProduct: Product?
    @State private var currentUser: User?
    @State private var productRows: [ProductRow] = []
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.netflixBlack.ignoresSafeArea()
            backgroundGradientLayers
            scrollViewLayers
            fullHeaderWithFilter
        }
        .foregroundStyle(.netflixWhite)
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var backgroundGradientLayers: some View {
        ZStack {
            LinearGradient(
                colors: [
                    .netflixDarkGray.opacity(1),
                    .netflixDarkGray.opacity(0)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            LinearGradient(
                colors: [
                    .netflixDarkRed.opacity(0.5),
                    .netflixDarkRed.opacity(0)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        }
        .frame(maxHeight: max(10, (400 + (scrollViewOffset * 0.75))))
        .opacity(scrollViewOffset < -250 ? 0 : 1)
        .animation(.easeInOut, value: scrollViewOffset)
    }
    
    private var fullHeaderWithFilter: some View {
        VStack(spacing: 0) {
            headerView
                .padding(.horizontal, 16)
            if scrollViewOffset > -20 {
                NetflixFilterBarView(
                    filters: filters,
                    selectedFilter: selectedFilter) { newFilter in
                        selectedFilter = newFilter
                    } onXMarkPressed: {
                        selectedFilter = nil
                    }
                    .padding(.top, 16)
                    .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
        .padding(.bottom, 8)
        .background(
            ZStack {
                if scrollViewOffset < -70 {
                    Rectangle()
                        .fill(Color.clear)
                        .background(.ultraThinMaterial)
                        .brightness(-0.2)
                        .ignoresSafeArea()
                }
            }
        )
        .animation(.smooth, value: scrollViewOffset)
        .readingFrame { frame in
            if fullHeaderSize == .zero {
                fullHeaderSize = frame.size
            }
        }
    }
    
    private var headerView: some View {
        HStack(spacing: 0) {
            Text("For Tao")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
                .onTapGesture {
                    router.dismissScreen()
                }
            HStack(spacing: 16) {
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture {
                        
                    }
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        
                    }
            }
            .font(.title2)
        }
    }
    
    private func heroCell(heroProduct: Product) -> some View {
        NetflixHeroCell(
            imageName: heroProduct.firstImage,
            isNetflixFilm: true,
            title: heroProduct.title,
            categories: [heroProduct.category.rawValue.capitalized, heroProduct.brand ?? "Sci-fi"],
            onBackgroundTap: {
                onProductPressed(heroProduct)
            },
            onPlayTap: {
                onProductPressed(heroProduct)
            },
            onMyListTap: {
                
            }
        )
        .padding(24)
    }
    
    private var scrollViewLayers: some View {
        ScrollViewWithOnScrollChanged(
            .vertical,
            showsIndicators: false,
            content: {
                VStack(spacing: 8) {
                    Rectangle()
                        .opacity(0)
                        .frame(height: fullHeaderSize.height)
                    if let heroProduct {
                        heroCell(heroProduct: heroProduct)
                    }
                    categoryRows
                }
            },
            onScrollChanged: { offset in
                scrollViewOffset = min(0, offset.y)
            }
        )
    }
    
    private var categoryRows: some View {
        LazyVStack(spacing: 16) {
            ForEach(Array(productRows.enumerated()), id: \.offset) { (rowIndex, row) in
                VStack(alignment: .leading, spacing: 6) {
                    Text(row.title)
                        .font(.headline)
                        .padding(.horizontal, 16)
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(Array(row.products.enumerated()), id: \.offset) { (index, product) in
                                NetflixMovieCell(
                                    imageName: product.firstImage,
                                    title: product.title,
                                    isRecentlyAdded: product.recentlyAdded,
                                    topTenRanking: (rowIndex==1) ? index+1 : nil
                                )
                                .onTapGesture {
                                    onProductPressed(product)
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
    
    private func getData() async {
        guard productRows.isEmpty else { return }
        do {
            currentUser = try await DataBaseHelper().getUsers().first
            let products = try await DataBaseHelper().getProducts()
            heroProduct = products.first
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map({ $0.brand }))
            for brand in allBrands {
                let title: String = brand?.capitalized ?? "NA"
                rows.append(ProductRow(title: title, products: products.shuffled()))
                productRows = rows
            }
        } catch {
            
        }
    }
    
    private func onProductPressed(_ product: Product) {
        router.showScreen(.sheet) { _ in
            NetflixMovieDetailsView(product: product)
        }
    }
}

#Preview {
    RouterView { _ in
        NetflixHomeView()
    }
}
