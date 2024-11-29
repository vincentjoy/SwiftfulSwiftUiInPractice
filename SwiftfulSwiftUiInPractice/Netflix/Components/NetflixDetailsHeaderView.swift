//
//  NetflixDetailsHeaderView.swift
//  SwiftfulSwiftUiInPractice
//
//  Created by Vincent Joy on 29/11/24.
//

import SwiftUI
import SwiftfulUI

struct NetflixDetailsHeaderView: View {
    
    var imageName: String = Constants.randomImageURL
    var progress: Double = 0.35
    var onAirPlayTap: (() -> Void)?
    var onXMarkTap: (() -> Void)?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(urlString: imageName)
            CustomProgressBar(
                selection: progress,
                range: 0...1,
                backgroundColor: .netflixLightGray,
                foregroundColor: .netflixRed,
                cornerRadius: 2,
                height: 4
            )
            .padding(.bottom, 4)
            .animation(.linear, value: progress)
            
            HStack(spacing: 8) {
                Circle()
                    .fill(.netflixDarkGray)
                    .overlay(content: {
                        Image(systemName: "tv.badge.wifi")
                            .offset(y: 1)
                    })
                    .frame(width: 36, height: 36)
                    .onTapGesture {
                        onAirPlayTap?()
                    }
                Circle()
                    .fill(.netflixDarkGray)
                    .overlay(content: {
                        Image(systemName: "xmark")
                            .offset(y: 1)
                    })
                    .frame(width: 36, height: 36)
                    .onTapGesture {
                        onXMarkTap?()
                    }
            }
            .foregroundStyle(.bumbleWhite)
            .font(.subheadline)
            .fontWeight(.bold)
            .padding(8)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        }
        .aspectRatio(2, contentMode: .fit)
    }
}

#Preview {
    NetflixDetailsHeaderView()
}
