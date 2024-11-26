import SwiftUI
import SwiftfulUI

struct BumbleHomeView: View {
    
    @State private var filters: [String] = ["Everyone", "Trending"]
    @AppStorage("bumble_home_filter") private var selectedFilter: String = "Everyone"
    @State private var allUsers: [User] = []
    @State private var selectedIndex: Int = 0
    @State private var cardOffset: [Int: Bool] = [:] // [UserId: (Direction == Right)]
    
    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            VStack(spacing: 12) {
                header
                BumbleFilterView(options: filters, selection: $selectedFilter)
                    .background(Divider(), alignment: .bottom)
//                BumbleCardView()
                ZStack {
                    if !allUsers.isEmpty {
                        ForEach(Array(allUsers.enumerated()), id: \.offset) { (index, user) in
                            
                            let isPrevious = (selectedIndex-1 == index)
                            let isCurrent = (selectedIndex == index)
                            let isNext = (selectedIndex+1 == index)
                            
                            if isPrevious || isCurrent || isNext { // Only 3 cells need to be loaded at a time
                                let offsetValue = cardOffset[user.id]
                                userProfileCell(index: index)
                                    .zIndex(Double(allUsers.count - index))
                                    .offset(x: offsetValue == nil ? 0 : offsetValue == true ? 900 : -900)
                            }
                        }
                    } else {
                        ProgressView()
                    }
                }
                .frame(maxHeight: .infinity)
                .animation(.smooth, value: cardOffset)
            }
            .padding(8)
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func userDidSelect(index: Int, isLike: Bool) {
        let currentUser = allUsers[index]
        cardOffset[currentUser.id] = isLike
        selectedIndex += 1
    }
    
    private var header: some View {
        HStack(spacing: 8) {
            HStack(spacing: 0) {
                Image(systemName: "line.horizontal.3")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                Image(systemName: "arrow.uturn.left")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Bumble")
                .font(.title)
                .foregroundColor(.bumbleYellow)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Image(systemName: "slider.horizontal.3")
                .padding(8)
                .background(Color.black.opacity(0.001))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .onTapGesture {
                    
                }
        }
        .font(.title2)
        .fontWeight(.medium)
        .foregroundStyle(.bumbleBlack)
    }
    
    private func userProfileCell(index: Int) -> some View {
        Rectangle()
            .fill(Color.red)
            .overlay {
                Text("\(index)")
            }
            .withDragGesture(
                .horizontal,
                resets: true,
                rotationMultiplier: 1.05,
                scaleMultiplier: 0.9,
                onChanged: { dragOffset in
                    
                },
                onEnded: { dragOffset in
                    if dragOffset.width < -50 {
                        userDidSelect(index: index, isLike: false)
                    } else if dragOffset.width > 50 {
                        userDidSelect(index: index, isLike: true)
                    }
                }
            )
    }
    
    func getData() async {
        guard allUsers.isEmpty else { return }
        do {
            allUsers = try await DataBaseHelper().getUsers()
        } catch {}
    }
}

#Preview {
    BumbleHomeView()
}
