import SwiftUI
import SwiftfulUI

struct NetflixMovieDetailsCell: View {
    
    var title: String = "Breaking Bad"
    var isNew: Bool = true
    var yearReleased: String = "2008"
    var seasonCount: Int? = 2
    var hasClosedCaption: Bool = true
    var isTopTen: Int? = 4
    var descriptionText: String? = "Walter White, a chemistry teacher, discovers that he has cancer and decides to get into the meth-making business to repay his medical debts. His priorities begin to change when he partners with Jesse."
    var castText: String? = "Cast: Bryan Cranston, Aaron Paul, Anna Gunn"
    var onPlayTap: (() -> Void)?
    var onDownloadTap: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack(spacing: 8) {
                if isNew {
                    Text("New")
                        .foregroundStyle(.green)
                }
                Text(yearReleased)
                if let seasonCount {
                    Text("\(seasonCount) Seasons")
                }
                if hasClosedCaption {
                    Image(systemName: "captions.bubble")
                }
                
            }
            .foregroundStyle(.netflixLightGray)
            
            if let isTopTen {
                HStack(spacing: 8) {
                    topTenIcon
                    Text("#\(isTopTen) in TV Shows Today")
                        .font(.headline)
                }
            }
            
            VStack(spacing: 8) {
                HStack {
                    Image(systemName: "play.fill")
                    Text("Play")
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .foregroundStyle(.netflixDarkGray)
                .background(.netflixWhite)
                .cornerRadius(4)
                .asButton(.press) {
                    onPlayTap?()
                }
                
                HStack {
                    Image(systemName: "arrow.down.to.line.alt")
                    Text("Download")
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .foregroundStyle(.netflixWhite)
                .background(.netflixDarkGray)
                .cornerRadius(4)
                .asButton(.press) {
                    onDownloadTap?()
                }
            }
            .font(.callout)
            .fontWeight(.medium)
            
            Group {
                if let descriptionText {
                    Text(descriptionText)
                }
                if let castText {
                    Text(castText)
                        .foregroundStyle(.netflixLightGray)
                }
            }
            .font(.callout)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
        }
        .foregroundStyle(.netflixWhite)
    }
    
    var topTenIcon: some View {
        Rectangle()
            .fill(.netflixRed)
            .frame(width: 28, height: 28)
            .overlay {
                VStack(spacing: -4) {
                    Text("TOP")
                        .fontWeight(.bold)
                        .font(.system(size: 8))
                    Text("10")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                }
                .offset(y: 1)
            }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        NetflixMovieDetailsCell()
    }
}
