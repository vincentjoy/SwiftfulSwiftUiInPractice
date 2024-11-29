import SwiftUI

struct NetflixMovieDetailsView: View {
    
    var product: Product = .mock
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            Color.netflixDarkGray.opacity(0.3).ignoresSafeArea()
            
            VStack(spacing: 0) {
                
            }
        }
    }
}

#Preview {
    NetflixMovieDetailsView()
}
