//
//  ProfileViewModel.swift
//  Instagram
//
//  Created by Huynh Van Tuan on 14/06/2023.
//

import Foundation

class ProfileViewModel: ObservableObject {
    private let user: User
    private let posts: [Post]
    init(user: User, posts: [Post]) {
        self.user = user
        self.posts = posts
        fetchAllPostOfUser()
    }

    @Published var postsUser = [Post]()

    func fetchAllPostOfUser() {
        postsUser = posts.filter({ $0.ownerUid == user.id })
    }
}
