import Foundation

struct FilterModel: Hashable, Equatable {
    var title: String
    var isDropDown: Bool
    
    static var mockArray: [FilterModel] = [
        .init(title: "All", isDropDown: false),
        .init(title: "TV Shows", isDropDown: false),
        .init(title: "Movies", isDropDown: true),
        .init(title: "Shorts", isDropDown: false)
    ]
}
