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
                    
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    NetflixMovieDetailsView()
}
