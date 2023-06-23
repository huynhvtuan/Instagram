//
//  EditProfileView.swift
//  Instagram
//
//  Created by Huynh Van Tuan on 14/06/2023.
//

import PhotosUI
import SwiftUI

struct EditProfileView: View {
    @State private var imagePickerPersented = false
    @State private var selectedImage: PhotosPickerItem?
    @StateObject var viewModel: EditProfileViewModel
    private let cornerCircle: CGFloat = 80
    @Environment(\.dismiss) var dismiss

    init(user: User) {
        _viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }

    var body: some View {
        let size = ProfileImageSize.large
        NavigationStack {
            VStack {
                PhotosPicker(selection: $viewModel.selectedImage) {
                    VStack {
                        if let image = viewModel.profileImage {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: size.dimension, height: size.dimension)
                                .clipShape(Circle())
                        } else {
                            CircularProfileImageView(user: viewModel.user, size: size)
                        }
                        Text("Edit profile picture")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Divider()
                    }
                    .padding(.vertical, 8)
                }
                VStack {
                    EditProfileRowView(title: "Name", placeholder: "Enter your name", text: $viewModel.fullName)
                    EditProfileRowView(title: "Bio", placeholder: "Enter your bio", text: $viewModel.bio)
                }

                Spacer()
            }
            .padding(.top, 20)
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task { try await viewModel.updateUserData() }
                        dismiss()
                    } label: {
                        Text("Done")
                    }
                }
            }
        }
    }
}

struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String

    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)

            VStack(alignment: .leading) {
                TextField(placeholder, text: $text, axis: .vertical).padding(.horizontal)
                Divider()
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: User.MOCK_USER[0])
    }
}
