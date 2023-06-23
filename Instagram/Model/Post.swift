//
//  Post.swift
//  Instagram
//
//  Created by Huynh Van Tuan on 13/06/2023.
//

import Firebase
import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    let likes: Int
    let imageUrl: String
    let timeStamp: Timestamp
    var user: User?
}

extension Post {
    static var MOCK_POST: [Post] = [
        Post(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "wakanada forever", likes: 123, imageUrl: "poet1", timeStamp: Timestamp(), user: User.MOCK_USER[0]),
        Post(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "You use a mirror to look at your face; You use art to see your soul 💗💗", likes: 123, imageUrl: "nakira", timeStamp: Timestamp(), user: User.MOCK_USER[1]),
        Post(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption: "us ow us ow", likes: 456, imageUrl: "avartar", timeStamp: Timestamp(), user: User.MOCK_USER[3]),
    ]
}
