import Foundation
import SwiftfulRouting

@Observable
final class SpotifyHomeViewModel {
    let router: AnyRouter
    var currentUser: User?
    var selectedCategory: Category?
    var products: [Product] = []
    var productRows: [ProductRow] = []
    
    init(router: AnyRouter) {
        self.router = router
        self.currentUser = currentUser
        self.selectedCategory = selectedCategory
        self.products = products
        self.productRows = productRows
    }
    
    func getData() async {
        guard products.isEmpty else { return }
        do {
            currentUser = try await DataBaseHelper().getUsers().first
            products = try await Array(DataBaseHelper().getProducts().prefix(8))
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map({ $0.brand }))
            for brand in allBrands {
                let title: String = brand?.capitalized ?? "NA"
                rows.append(ProductRow(title: title, products: products))
                productRows = rows
            }
        } catch {
            
        }
    }
}
