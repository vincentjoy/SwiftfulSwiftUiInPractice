//
//  NetflixFilterBarView.swift
//  SwiftfulSwiftUiInPractice
//
//  Created by Vincent Joy on 28/11/24.
//

import SwiftUI

struct NetflixFilterBarView: View {
    
    var filters: [FilterModel] = FilterModel.mockArray
    var selectedFilter: FilterModel?
    var onFilterPressed: ((FilterModel) -> Void)?
    var onXMarkPressed: (() -> Void)?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                if selectedFilter != nil {
                    Image(systemName: "xmark")
                        .padding(8)
                        .background(
                            Circle()
                                .stroke(lineWidth: 1)
                        )
                        .foregroundStyle(Color.netflixLightGray)
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            onXMarkPressed?()
                        }
                        .transition(AnyTransition.move(edge: .leading))
                        .padding(.leading, 8)
                }
                
                ForEach(filters, id: \.self) { filter in
                    if selectedFilter == nil || selectedFilter == filter {
                        NetflixFilterCell(
                            title: filter.title,
                            isDropDown: filter.isDropDown,
                            isSelected: (selectedFilter == filter)
                        )
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            onFilterPressed?(filter)
                        }
                        .padding(.leading, ((selectedFilter == nil) && (filter == filters.first)) ? 8 : 0)
                    }
                }
            }
            .padding(.vertical, 4)
        }
        .scrollIndicators(.hidden)
        .animation(.bouncy, value: selectedFilter)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        NetflixFilterBarView()
    }
}
