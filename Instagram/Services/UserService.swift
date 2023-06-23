//
//  UserService.swift
//  Instagram
//
//  Created by Huynh Van Tuan on 14/06/2023.
//

import Firebase
import Foundation

class UserService: ObservableObject {
    static func fetchAllUser() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }

    static func loadUserData(withUid: String) async throws -> User? {
        let snapshot = try await Firestore.firestore().collection("users").document(withUid).getDocument()
        return try? snapshot.data(as: User.self)
    }
}
