//
//  NetflixHeroCell.swift
//  SwiftfulSwiftUiInPractice
//
//  Created by Vincent Joy on 28/11/24.
//

import SwiftUI

struct NetflixHeroCell: View {
    
    var imageName: String = Constants.randomImageURL
    var isNetflixFilm: Bool = true
    var title: String = "Inception"
    var categories: [String] = ["Action", "Sci-Fi", "Thriller"]
    var onBackgroundTap: (() -> Void)?
    var onPlayTap: (() -> Void)?
    var onMyListTap: (() -> Void)?
    
    var body: some View {
        Rectangle()
            .aspectRatio(0.8, contentMode: .fit)
    }
}

#Preview {
    NetflixHeroCell()
        .padding(40)
}
