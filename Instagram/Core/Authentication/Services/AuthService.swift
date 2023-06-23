//
//  AuthService.swift
//  Instagram
//
//  Created by Huynh Van Tuan on 13/06/2023.
//

import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift
import Foundation

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    static let shared = AuthService()

    init() {
        userSession = Auth.auth().currentUser
        Task {
            try await loadUserData()
        }
    }

    @MainActor
    func login(withEmail: String, password: String) async throws {
        do {
            let _result = try await Auth.auth().signIn(withEmail: withEmail, password: password)
            userSession = _result.user
            try await loadUserData()
        } catch {
            print(error.localizedDescription)
        }
    }

    @MainActor
    func createUser(email: String, password: String, userName: String, fullName: String) async throws {
        do {
            let _result = try await Auth.auth().createUser(withEmail: email, password: password)
            userSession = _result.user
            print("DEBUG:Did create user....")
            await uploadUserData(uid: _result.user.uid, userName: userName, email: email, fullName: fullName)
            print("DEBUG:Did upload user data....")
        } catch {
            print(error.localizedDescription)
        }
    }

    @MainActor
    func loadUserData() async throws {
        guard let currentUid = userSession?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        currentUser = try? snapshot.data(as: User.self)
    }

    func signOut() {
        try? Auth.auth().signOut()
        userSession = nil
        currentUser = nil
    }

    private func uploadUserData(uid: String, userName: String, email: String, fullName: String) async {
        let user = User(id: uid, userName: userName, fullName: fullName, email: email)
        currentUser = user
        guard let encodeUser = try? Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodeUser)
    }
}
