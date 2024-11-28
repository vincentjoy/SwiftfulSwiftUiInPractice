import SwiftUI

struct NetflixHomeView: View {
    
    @State private var filters = FilterModel.mockArray
    @State private var selectedFilter: FilterModel?
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            VStack(spacing: 0) {
                headerView
                    .padding(.horizontal, 16)
                NetflixFilterBarView(
                    filters: filters,
                    selectedFilter: selectedFilter) { newFilter in
                        selectedFilter = newFilter
                    } onXMarkPressed: {
                        selectedFilter = nil
                    }
                    .padding(.top, 16)
                Spacer()
            }
        }
        .foregroundStyle(.netflixWhite)
    }
    
    private var headerView: some View {
        HStack(spacing: 0) {
            Text("For Tao")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
            HStack(spacing: 16) {
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture {
                        
                    }
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        
                    }
            }
            .font(.title2)
        }
    }
}

#Preview {
    NetflixHomeView()
}
