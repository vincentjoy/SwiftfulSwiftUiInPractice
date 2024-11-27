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
        .overlay (
            ZStack {
                if hasNewMessage {
                    Circle()
                        .fill(.bumbleWhite)
                    Circle()
                        .fill(.bumbleYellow)
                        .padding(4)
                }
            }
            .frame(width: 24, height: 24)
            .offset(x: 2, y: 2)
            , alignment: .bottomTrailing
        )
    }
}

#Preview {
    VStack {
        BumbleProfileImageCell(imageName: Constants.userImage2)
        BumbleProfileImageCell(percentageRemaining: 0.75)
        BumbleProfileImageCell(imageName: Constants.userImage2, percentageRemaining: 1)
        BumbleProfileImageCell(hasNewMessage: false)
    }
}
