import SwiftUI
import SwiftfulUI

struct NetflixHomeView: View {
    
    @State private var filters = FilterModel.mockArray
    @State private var selectedFilter: FilterModel?
    @State private var fullHeaderSize: CGSize = .zero
    @State private var heroProduct: Product?
    @State private var currentUser: User?
    @State private var productRows: [ProductRow] = []
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.netflixBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                VStack(spacing: 8) {
                    Rectangle()
                        .opacity(0)
                        .frame(height: fullHeaderSize.height)
                    if let heroProduct {
                        NetflixHeroCell(
                            imageName: heroProduct.firstImage,
                            isNetflixFilm: true,
                            title: heroProduct.title,
                            categories: [heroProduct.category.rawValue.capitalized, heroProduct.brand ?? "Sci-fi"],
                            onBackgroundTap: {
                                
                            },
                            onPlayTap: {
                                
                            },
                            onMyListTap: {
                                
                            }
                        )
                        .padding(24)
                    }
                    ForEach(0..<10) { _ in
                        Rectangle()
                            .fill(Color.red)
                            .frame(height: 200)
                    }
                }
            }
            .scrollIndicators(.hidden)
            
            VStack(spacing: 0) {
                headerView
                    .padding(.horizontal, 16)
                NetflixFilterBarView(
                    filters: filters,
                    selectedFilter: selectedFilter) { newFilter in
                        selectedFilter = newFilter
                    } onXMarkPressed: {
                        selectedFilter = nil
                    }
                    .padding(.top, 16)
                Spacer()
            }
            .readingFrame { frame in
                fullHeaderSize = frame.size
            }
        }
        .foregroundStyle(.netflixWhite)
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var headerView: some View {
        HStack(spacing: 0) {
            Text("For Tao")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
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
    
    func getData() async {
        guard productRows.isEmpty else { return }
        do {
            currentUser = try await DataBaseHelper().getUsers().first
            let products = try await DataBaseHelper().getProducts()
            heroProduct = products.first
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map({ $0.brand }))
            for brand in allBrands {
                let title: String = brand?.capitalized ?? "NA"
                rows.append(ProductRow(title: title, products: products))
                productRows = rows
            }
        } catch {
            
        }
    }
}

#Preview {
    NetflixHomeView()
}
