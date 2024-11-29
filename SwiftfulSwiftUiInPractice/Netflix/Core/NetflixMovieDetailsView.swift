import SwiftUI

struct NetflixMovieDetailsView: View {
    
    var product: Product = .mock
    @State private var progress: Double = 0.2
    
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
                    VStack(spacing: 8) {
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
                    }
                    .padding(8)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    NetflixMovieDetailsView()
}
