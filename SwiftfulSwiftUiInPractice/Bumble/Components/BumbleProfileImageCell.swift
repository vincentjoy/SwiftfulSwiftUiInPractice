//
//  BumbleProfileImageCell.swift
//  SwiftfulSwiftUiInPractice
//
//  Created by Vincent Joy on 27/11/24.
//

import SwiftUI

struct BumbleProfileImageCell: View {
    
    var imageName: String = Constants.userImage1
    var percentageRemaining: Double = 0.5
    var hasNewMessage: Bool = true
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.bumbleGray, lineWidth: 2)
            Circle()
                .trim(from: 0, to: percentageRemaining)
                .stroke(Color.bumbleYellow, lineWidth: 4)
                .rotationEffect(Angle(degrees: 90))
            ImageLoaderView(urlString: imageName)
                .clipShape(Circle())
                .padding(5)
        }
        .frame(width: 75, height: 75)
        .overlay {
            
        }
    }
}

#Preview {
    BumbleProfileImageCell()
}
