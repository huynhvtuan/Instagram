//
//  EditProfileViewModel.swift
//  Instagram
//
//  Created by Huynh Van Tuan on 14/06/2023.
//

import Firebase
import Foundation
import PhotosUI
import SwiftUI

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User

    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }

    @Published var profileImage: Image?
    @Published var fullName: String = ""
    @Published var bio: String = ""
    private var uiImage: UIImage?

    init(user: User) {
        self.user = user
        fullName = user.fullName ?? fullName
        bio = user.bio ?? bio
    }

    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        profileImage = Image(uiImage: uiImage)
    }

    func updateUserData() async throws {
        var data = [String: Any]()
        // update image if change

        if let uiImage = uiImage {
            let imageUrl = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImgUrl"] = imageUrl
        }

        // update name if change
        if !fullName.isEmpty && user.fullName != fullName {
            data["fullName"] = fullName
        }

        // update bio if change
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
    }
}
