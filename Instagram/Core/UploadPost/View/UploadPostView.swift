//
//  UploadPostView.swift
//  Instagram
//
//  Created by Huynh Van Tuan on 13/06/2023.
//

import PhotosUI
import SwiftUI

struct UploadPostView: View {
    @State private var imagePickerPersented = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    PhotosPicker(selection: $viewModel.selectedImage) {
                        if let image = viewModel.postImage {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipped()
                        } else {
                            Image(systemName: "photo.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .clipped()
                        }
                    }
                    TextField("Your title", text: $viewModel.caption, axis: .vertical)
                }.padding()
                Spacer()
            }
            .onAppear {
                imagePickerPersented.toggle()
            }
            .photosPicker(isPresented: $imagePickerPersented, selection: $viewModel.selectedImage)
            .navigationTitle("New Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        viewModel.caption = ""
                        viewModel.selectedImage = nil
                        viewModel.postImage = nil
                        tabIndex = 0
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task {
                            try await viewModel.uploadImagePost()
                            tabIndex = 0
                        }
                    } label: {
                        Text("Upload")
                    }
                }
            }
        }
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView(tabIndex: .constant(0))
    }
}
