//
//  SpotifyHomeView.swift
//  SwiftfulSwiftUiInPractice
//
//  Created by Vincent Joy on 21/11/24.
//

import SwiftUI

struct SpotifyHomeView: View {
    
    @State private var currentUser: User?
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            HStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .frame(width: 30, height: 30)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            print("User profile icon tapped")
                        }
                }
            }
        }
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            currentUser = try await DataBaseHelper().getUsers().first
        } catch {
            
        }
    }
}

#Preview {
    SpotifyHomeView()
}
