//
//  ProfileView.swift
//  Instagram
//
//  Created by Huynh Van Tuan on 13/06/2023.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    @EnvironmentObject private var feedViewModel : FeedViewModel
    private var posts: [Post] {
        Post.MOCK_POST.filter({ $0.user?.userName == user.userName })
    }

    var body: some View {
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
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USER[1])
    }
}
