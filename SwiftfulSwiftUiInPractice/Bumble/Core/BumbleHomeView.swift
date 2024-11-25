import SwiftUI

struct BumbleHomeView: View {
    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            VStack(spacing: 8) {
                header
                Spacer()
            }
            .padding(8)
        }
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
}

#Preview {
    BumbleHomeView()
}
