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
}
