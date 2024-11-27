import SwiftUI

struct BumbleChatPreviewCell: View {
    
    var imageName: String = Constants.userImage1
    var percentageRemaining: Double = 0.5
    var hasNewMessage: Bool = true
    var userName: String = "Pranjal"
    var lastChatMessage: String? = "Coffee tomorrow?"
    var isYourMove: Bool = true
    
    var body: some View {
        HStack(spacing: 16) {
            BumbleProfileImageCell(imageName: imageName, percentageRemaining: percentageRemaining, hasNewMessage: hasNewMessage)
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 0) {
                    Text(userName)
                        .font(.headline)
                        .foregroundColor(.bumbleBlack)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    if isYourMove {
                        Text("YOUR MOVE")
                            .font(.caption2)
                            .bold()
                            .padding(.vertical, 4)
                            .padding(.horizontal, 6)
                            .background(.bumbleYellow)
                            .cornerRadius(32)
                    }
                }
                if let lastChatMessage {
                    Text(lastChatMessage)
                        .font(.subheadline)
                        .foregroundColor(.bumbleGray)
                        .padding(.trailing, 16)
                }
            }
            .lineLimit(1)
        }
    }
}

#Preview {
    BumbleChatPreviewCell()
        .padding()
}
