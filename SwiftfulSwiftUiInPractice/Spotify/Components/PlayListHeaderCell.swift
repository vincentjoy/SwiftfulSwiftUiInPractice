//
//  PlayListHeaderCell.swift
//  SwiftfulSwiftUiInPractice
//
//  Created by Vincent Joy on 22/11/24.
//

import SwiftUI

struct PlayListHeaderCell: View {
    
    var title: String = "Play List Header"
    var subtitle: String = "Subtitle goes here"
    var imageName: String = Constants.randomImageURL
    var shadowColor: Color = .spotifyBlack.opacity(0.8)
    
    var body: some View {
        ImageLoaderView(urlString: imageName)
            .overlay(alignment: .bottom, content: {
                VStack(alignment: .leading, spacing: 8) {
                    Text(subtitle)
                        .font(.headline)
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    LinearGradient(gradient: Gradient(colors: [shadowColor.opacity(0), shadowColor]), startPoint: .top, endPoint: .bottom)
                )
            })
            .frame(height: 300)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ScrollView {
            PlayListHeaderCell()
        }
        .ignoresSafeArea()
    }
}
