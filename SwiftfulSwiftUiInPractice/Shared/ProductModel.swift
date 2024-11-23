import Foundation

// MARK: - ProductData
struct ProductData: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let category: ProductCategory
    let price, discountPercentage, rating: Double
    let stock: Int
    let brand: String?
    let images: [String]
    let thumbnail: String
    
    var firstImage: String {
        images.first ?? Constants.randomImageURL
    }
    
    static var mock: Product {
        .init(
            id: 1,
            title: "Mock product",
            description: "Some mock description goes here",
            category: .beauty,
            price: 100,
            discountPercentage: 0,
            rating: 4.5,
            stock: 10,
            brand: nil,
            images: [Constants.randomImageURL, Constants.randomImageURL, Constants.randomImageURL],
            thumbnail: Constants.randomImageURL
        )
    }
}

// MARK: - Category
enum ProductCategory: String, Codable {
    case beauty = "beauty"
    case fragrances = "fragrances"
    case furniture = "furniture"
    case groceries = "groceries"
}

struct ProductRow: Identifiable {
    let id = UUID()
    let title: String
    let products: [Product]
}
