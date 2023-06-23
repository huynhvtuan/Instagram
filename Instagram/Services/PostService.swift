//
//  PostService.swift
//  Instagram
//
//  Created by Huynh Van Tuan on 14/06/2023.
//

import Firebase
import Foundation

class PostService: ObservableObject {
    static func fetchAllPost() async throws -> [Post] {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        let result = snapshot.documents.compactMap({ try? $0.data(as: Post.self) })
        return result
    }
}
