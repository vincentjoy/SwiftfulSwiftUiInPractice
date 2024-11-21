import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ContentView: View {
    
    @State private var users: [User] = []
    @State private var products: [Product] = []
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(users) { user in
                    Text(user.firstName)
                }
                .foregroundStyle(.spotifyLightGray)
                
                ForEach(products) { product in
                    Text(product.title)
                }
                .foregroundStyle(.spotifyGreen)
            }
        }
        .padding()
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            users = try await DataBaseHelper().getUsers()
            products = try await DataBaseHelper().getProducts()
        } catch {
            
        }
    }
}

#Preview {
    ContentView()
}
