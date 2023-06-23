//
//  FeedViewModel.swift
//  Instagram
//
//  Created by Huynh Van Tuan on 14/06/2023.
//

import Firebase
import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()

    init() {
        Task {
            try await fetchPost()
        }
    }

    @MainActor
    func fetchPost() async throws {
        let posts = try await PostService.fetchAllPost()
        print(posts)
        self.posts = posts
        await getUserUid()
    }

    @MainActor
    func getUserUid() async {
        for i in 0 ..< posts.count {
            guard let user = try? await UserService.loadUserData(withUid: posts[i].ownerUid) else { return }
            posts[i].user = user
        }
    }
}
