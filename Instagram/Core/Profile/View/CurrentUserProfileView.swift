//
//  CurrentUserProfileView.swift
//  Instagram
//
//  Created by Huynh Van Tuan on 13/06/2023.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User
    @EnvironmentObject private var feedViewModel: FeedViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    //  heaeder
                    ProfileHeaderView(user: user)
                    // post and list view

                    PostGridView(user: user, posts: feedViewModel.posts)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user: User.MOCK_USER[3])
    }
}
