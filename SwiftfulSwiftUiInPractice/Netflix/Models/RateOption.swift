//
//  RateOption.swift
//  SwiftfulSwiftUiInPractice
//
//  Created by Vincent Joy on 30/11/24.
//

import Foundation

enum RateOption: String, CaseIterable {
    case dislike, like, love
    
    var title: String {
        switch self {
        case .dislike: return "Not for me"
        case .like: return "I like this"
        case .love: return "Love this!"
        }
    }
    
    var iconName: String {
        switch self {
        case .dislike: return "hand.thumbsdown"
        case .like: return "hand.thumbsup"
        case .love: return "bolt.heart"
        }
    }
}
