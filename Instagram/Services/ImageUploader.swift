//
//  ImageUpLoader.swift
//  Instagram
//
//  Created by Huynh Van Tuan on 14/06/2023.
//

import Firebase
import FirebaseStorage
import UIKit

struct ImageUploader {
    static func uploadImage(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let fileName = UUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(fileName)")

        do {
            _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString

        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

    static func uploadImagePost(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let fileName = UUID().uuidString
        let ref = Storage.storage().reference(withPath: "/post_image/\(fileName)")

        do {
            _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString

        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
