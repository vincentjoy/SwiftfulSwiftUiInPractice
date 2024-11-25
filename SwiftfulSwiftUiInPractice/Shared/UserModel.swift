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
    
    var work: String {
        "Apple"
    }
    var education: String {
        "PhD"
    }
    
    static var mock: User {
        User(
            id: 1,
            firstName: "John",
            lastName: "Doe",
            age: 20,
            gender: .male,
            email: "john@doe.com",
            phone: "+1234567890",
            username: "johndoe",
            password: "password",
            image: Constants.randomImageURL,
            height: 170,
            weight: 70
        )
    }
}

// MARK: - Gender
enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}
