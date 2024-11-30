import SwiftUI

struct MyListButton: View {
    
    var isMyList: Bool = true
    var onButtonTap: (()->Void)?
    
    var body: some View {
        VStack {
            ZStack {
                Image(systemName: "checkmark")
                    .opacity(isMyList ? 1 : 0)
                    .rotationEffect(Angle(degrees: isMyList ? 0 : 180))
                Image(systemName: "plus")
                    .opacity(isMyList ? 0 : 1)
                    .rotationEffect(Angle(degrees: isMyList ? -180 : 0))
            }
            .font(.title)
            Text("My List")
                .font(.caption)
                .foregroundStyle(.netflixLightGray)
        }
        .foregroundStyle(.netflixWhite)
        .padding(8)
        .background(Color.black.opacity(0.001))
        .animation(.bouncy, value: isMyList)
        .onTapGesture {
            onButtonTap?()
        }
    }
}

fileprivate struct MyListButtonPreview: View {
    
    @State private var isMyList: Bool = true
    
    var body: some View {
        MyListButton(isMyList: isMyList) {
            isMyList.toggle()
        }
    }
}

#Preview {
    MyListButtonPreview()
}
