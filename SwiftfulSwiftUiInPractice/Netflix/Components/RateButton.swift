import SwiftUI

struct RateButton: View {
    
    @State private var showPopover: Bool = false
    var onRatingTap: ((RateOption) -> Void)?
    
    var body: some View {
        VStack {
            Image(systemName: "hand.thumbsup")
                .font(.title)
            Text("Rate")
                .font(.caption)
                .foregroundStyle(.netflixLightGray)
        }
        .foregroundStyle(.netflixWhite)
        .padding(8)
        .background(Color.black.opacity(0.001))
        .onTapGesture {
            showPopover.toggle()
        }
        .popover(isPresented: $showPopover) {
            ZStack {
                Color.netflixDarkGray.ignoresSafeArea()
                HStack(spacing: 12) {
                    ForEach(RateOption.allCases, id: \.self) { option in
                        rateButton(rateOption: option)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
            }
            .presentationCompactAdaptation(.popover)
        }
    }
    
    private func rateButton(rateOption: RateOption) -> some View {
        VStack(spacing: 8) {
            Image(systemName: rateOption.iconName)
                .font(.title2)
            Text(rateOption.title)
                .font(.caption)
        }
        .foregroundStyle(.netflixWhite)
        .padding(4)
        .background(Color.black.opacity(0.001))
        .onTapGesture(perform: {
            showPopover = false
            onRatingTap?(rateOption)
        })
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        RateButton()
    }
}
