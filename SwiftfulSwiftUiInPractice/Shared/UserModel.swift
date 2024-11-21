import Foundation

// MARK: - UserData
struct UserData: Codable {
    let users: [User]
    let total, skip, limit: Int
}

// MARK: - User
struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let gender: Gender
    let email, phone, username, password: String
    let image: String
    let height, weight: Double
}

// MARK: - Gender
enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}
