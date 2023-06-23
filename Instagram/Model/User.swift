//
//  User.swift
//  Instagram
//
//  Created by Huynh Van Tuan on 13/06/2023.
//

import FirebaseAuth
import Foundation

struct User: Identifiable, Hashable, Codable {
    var id: String
    var userName: String
    var profileImgUrl: String?
    var fullName: String?
    var bio: String?
    let email: String
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var MOCK_USER: [User] = [
        User(id: NSUUID().uuidString, userName: "batman", profileImgUrl: "poet1", fullName: "Ronaldo Batman", bio: "Hello I'm batman , i help you", email: "batman@gmail.com"),
        User(id: NSUUID().uuidString, userName: "Nakira", profileImgUrl: "nakira", fullName: "Ronaldo Batman", bio: "Hello I'm batman , i help you", email: "batman@gmail.com"),
        User(id: NSUUID().uuidString, userName: "batman", fullName: nil, bio: "Hello I'm batman , i help you", email: "batman@gmail.com"),
        User(id: NSUUID().uuidString, userName: "Hl", profileImgUrl: "avartar", fullName: "Tran Ha Linh", bio: "Hello I'm ha linh , i pet pet", email: "halinh@gmail.com"),
    ]
}
