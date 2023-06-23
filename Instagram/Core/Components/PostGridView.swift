//
//  PostGridView.swift
//  Instagram
//
//  Created by Huynh Van Tuan on 13/06/2023.
//

import Kingfisher
import SwiftUI

struct PostGridView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    @StateObject var profileViewModel: ProfileViewModel
    init(user: User, posts: [Post]) {
        _profileViewModel = StateObject(wrappedValue: ProfileViewModel(user: user, posts: posts))
    }

    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(profileViewModel.postsUser) { post in
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension, height: imageDimension)
                    .clipped()
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView(user: User.MOCK_USER[0], posts: Post.MOCK_POST)
    }
}
