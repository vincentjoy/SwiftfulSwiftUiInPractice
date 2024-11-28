//
//  NetflixFilterCell.swift
//  SwiftfulSwiftUiInPractice
//
//  Created by Vincent Joy on 28/11/24.
//

import SwiftUI

struct NetflixFilterCell: View {
    
    var title: String = "Categories"
    var isDropDown: Bool = true
    var isSelected: Bool = false
    
    var body: some View {
        HStack(spacing: 4) {
            Text(title)
            if isDropDown {
                Image(systemName: "chevron.down")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(
            ZStack {
                Capsule(style: .circular)
                    .fill(.netflixDarkGray)
                    .opacity(isSelected ? 1 : 0)
                Capsule(style: .circular)
                    .stroke(lineWidth: 1)
            }
        )
        .foregroundStyle(Color.netflixLightGray)
    }
}

#Preview {
    NetflixFilterCell()
}
