//
//  BumbleChatsView.swift
//  SwiftfulSwiftUiInPractice
//
//  Created by Vincent Joy on 27/11/24.
//

import SwiftUI

struct BumbleChatsView: View {
    
    @State private var allUsers: [User] = []
    
    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            VStack(spacing: 0) {
                header
                    .padding()
                Spacer()
            }
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            Image(systemName: "line.horizontal.3")
            Spacer(minLength: 0)
            Image(systemName: "magnifyingglass")
        }
        .font(.title)
        .fontWeight(.medium)
    }
    
    func getData() async {
        guard allUsers.isEmpty else { return }
        do {
            allUsers = try await DataBaseHelper().getUsers()
        } catch {}
    }
}

#Preview {
    BumbleChatsView()
}
