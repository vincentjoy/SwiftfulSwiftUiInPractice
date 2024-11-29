import SwiftUI

struct NetflixMovieDetailsCell: View {
    
    var title: String = "Breaking Bad"
    var isNew: Bool = true
    var yearReleased: String = "2008"
    var seasonCount: Int? = 2
    var hasClosedCaption: Bool = true
    var isTopTen: Int? = 4
    var descriptionText: String = "Walter White, a chemistry teacher, discovers that he has cancer and decides to get into the meth-making business to repay his medical debts. His priorities begin to change when he partners with Jesse."
    var casr: String = "Cast: Bryan Cranston, Aaron Paul, Anna Gunn"
    var onPlayTap: (() -> Void)?
    var onDownloadTap: (() -> Void)?
    
    var body: some View {
        VStack {
            
        }
        .foregroundStyle(.netflixWhite)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        NetflixMovieDetailsCell()
    }
}
