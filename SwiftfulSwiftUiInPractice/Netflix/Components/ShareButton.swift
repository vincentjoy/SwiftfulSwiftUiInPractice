//
//  ShareButton.swift
//  SwiftfulSwiftUiInPractice
//
//  Created by Vincent Joy on 30/11/24.
//

import SwiftUI

struct ShareButton: View {
    
    var urlString: String = "https://www.apple.com"
    
    var body: some View {
        if let url = URL(string: urlString) {
            ShareLink(item: url) {
                VStack {
                    Image(systemName: "square.and.arrow.up")
                        .font(.title)
                    Text("Share")
                        .font(.caption)
                        .foregroundStyle(.netflixLightGray)
                }
                .foregroundStyle(.netflixWhite)
                .padding(8)
                .background(Color.black.opacity(0.001))
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ShareButton()
    }
}
