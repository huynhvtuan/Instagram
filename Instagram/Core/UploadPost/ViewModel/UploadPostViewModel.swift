//
//  UploadPostViewModel.swift
//  Instagram
//
//  Created by Huynh Van Tuan on 13/06/2023.
//

import Firebase
import FirebaseAuth
import FirebaseStorage
import Foundation
import PhotosUI
import SwiftUI

@MainActor
class UploadPostViewModel: ObservableObject {
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }

    @Published var postImage: Image?
    @Published var caption: String = ""
    private var uiImage: UIImage?

    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        postImage = Image(uiImage: uiImage)
    }

    func uploadImagePost() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = uiImage else { return }
        let ref = Firestore.firestore().collection("posts").document()

        guard let imageURl = try await ImageUploader.uploadImagePost(image: uiImage) else { return }
        let post = Post(id: ref.documentID, ownerUid: uid, caption: caption, likes: 0, imageUrl: imageURl, timeStamp: Timestamp())

        guard let encodePost = try? Firestore.Encoder().encode(post) else { return }

        try await ref.setData(encodePost)
    }
}
