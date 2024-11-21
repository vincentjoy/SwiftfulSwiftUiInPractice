import SwiftUI

struct SpotifyHomeView: View {
    
    @State private var currentUser: User?
    @State private var selectedCategory: Category?
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            Header
        }
        .task {
            await getData()
        }
    }
    
    private var Header: some View {
        HStack(spacing: 0) {
            ZStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            print("User profile icon tapped")
                        }
                }
            }
            .frame(width: 35, height: 35)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected:( category == selectedCategory)
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
    }
    
    private func getData() async {
        do {
            currentUser = try await DataBaseHelper().getUsers().first
        } catch {
            
        }
    }
}

#Preview {
    SpotifyHomeView()
}
