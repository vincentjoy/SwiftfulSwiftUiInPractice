import SwiftUI

struct PlaylistDescriptionFile: View {
    
    var descriptionText: String = Product.mock.description
    var userName: String = "Nick"
    var subheadline: String = "laptop"
    var onAddToPlaylistPressed: (() -> Void)?
    var onDownloadPressed: (() -> Void)?
    var onSharePressed: (() -> Void)?
    var onEllipsisPressed: (() -> Void)?
    var onShufflePressed: (() -> Void)?
    var onPlayPressed: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(descriptionText)
                .foregroundColor(.spotifyLightGray)
                .frame(maxWidth: .infinity, alignment: .leading)
            madeForYouSection
            Text(subheadline)
            buttonsRow
        }
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(.spotifyLightGray)
    }
    
    private var madeForYouSection: some View {
        HStack {
            Image(systemName: "applelogo")
                .font(.title3)
                .foregroundStyle(.spotifyGreen)
            Text("Made for ")
            +
            Text(userName)
                .bold()
                .foregroundStyle(.spotifyWhite)
        }
    }
    
    private var buttonsRow: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "plus.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        onAddToPlaylistPressed?()
                    }
                Image(systemName: "arrow.down.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        onDownloadPressed?()
                    }
                Image(systemName: "square.and.arrow.up")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        onSharePressed?()
                    }
                Image(systemName: "ellipsis")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        onEllipsisPressed?()
                    }
            }
            .offset(x: -8)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 8) {
                Image(systemName: "shuffle")
                    .font(.system(size: 24))
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 46))
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
            }
            .foregroundStyle(.spotifyGreen)
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        PlaylistDescriptionFile()
            .padding()
    }
}
