import Foundation

struct DataBaseHelper {
    
    func getProducts() async throws -> [Product] {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let productsArray = try JSONDecoder().decode(ProductData.self, from: data)
        return productsArray.products
    }
    
    func getUsers() async throws -> [User] {
        guard let url = URL(string: "https://dummyjson.com/users") else {
            throw URLError(.badURL)
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let usersData = try JSONDecoder().decode(UserData.self, from: data)
        return usersData.users
    }
}
