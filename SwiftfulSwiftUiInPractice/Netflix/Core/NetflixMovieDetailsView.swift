import SwiftUI

struct NetflixMovieDetailsView: View {
    
    var product: Product = .mock
    @State private var progress: Double = 0.2
    @State private var isMyList: Bool = false
    @State private var products: [Product] = []
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            Color.netflixDarkGray.opacity(0.3).ignoresSafeArea()
            
            VStack(spacing: 0) {
                NetflixDetailsHeaderView(
                    imageName: product.firstImage,
                    progress: progress,
                    onAirPlayTap: {
                        
                    },
                    onXMarkTap: {
                        
                    }
                )
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 8) {
                        NetflixMovieDetailsCell(
                            title: product.title,
                            isNew: true,
                            yearReleased: "2022",
                            seasonCount: 6,
                            hasClosedCaption: true,
                            isTopTen: 2,
                            descriptionText: product.description,
                            castText: "Cast: Bob Odenkirk, Jonathan Banks, Giancarlo Esposito",
                            onPlayTap: {
                                
                            },
                            onDownloadTap: {
                                
                            }
                        )
                        
                        HStack(spacing: 32) {
                            MyListButton(isMyList: isMyList) {
                                isMyList.toggle()
                            }
                            RateButton { selection in
                                print(selection)
                            }
                            ShareButton()
                        }
                        .padding(.leading, 16)
                        
                        VStack(alignment: .leading) {
                            Text("More like this")
                                .font(.headline)
                            
                        }
                        .foregroundStyle(.netflixWhite)
                    }
                    .padding(8)
                }
                .scrollIndicators(.hidden)
            }
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        guard products.isEmpty else { return }
        do {
            products = try await DataBaseHelper().getProducts()
        } catch {
            
        }
    }
}

#Preview {
    NetflixMovieDetailsView()
}
