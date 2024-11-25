//
//  InterestPillGridView.swift
//  SwiftfulSwiftUiInPractice
//
//  Created by Vincent Joy on 25/11/24.
//

import SwiftUI
import SwiftfulUI

struct InterestPillGridView: View {
    
    var interests: [UserInterest] = User.mock.interests
    
    var body: some View {
        ZStack {
            NonLazyVGrid(
                columns: 2,
                alignment: .leading,
                spacing: 8,
                items: interests) { interest in
                    if let interest {
                        InterestPillView(
                            iconName: interest.iconName,
                            emoji: interest.emoji,
                            text: interest.text
                        )
                    } else {
                        EmptyView()
                    }
                }
        }
    }
}

#Preview {
    VStack(alignment: .leading, spacing: 40) {
        InterestPillGridView(interests: User.mock.interests)
        InterestPillGridView(interests: User.mock.basics)
    }
}
