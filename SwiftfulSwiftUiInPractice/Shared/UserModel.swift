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
    var aboutMe: String {
        "This is a sentace about me that says who I am and what I like."
    }
    
    var basics: [UserInterest] {
        [
            UserInterest(iconName: "ruler", emoji: nil, text: "\(height)"),
            UserInterest(iconName: "graduationcap", emoji: nil, text: education),
            UserInterest(iconName: "wineglass", emoji: nil, text: "Socially"),
            UserInterest(iconName: "moon.stars.fill", emoji: nil, text: "Virgo"),
        ]
    }
    var interests: [UserInterest] {
        [
            UserInterest(iconName: nil, emoji: "👟", text: "Running"),
            UserInterest(iconName: nil, emoji: "🏋️‍♀️", text: "Gym"),
            UserInterest(iconName: nil, emoji: "🎧", text: "Music"),
            UserInterest(iconName: nil, emoji: "🍪", text: "Cooking"),
        ]
    }
    var images: [String] {
        [Constants.userImage1, Constants.userImage2, Constants.userImage3]
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
