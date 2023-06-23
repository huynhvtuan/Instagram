//
//  FeedCell.swift
//  Instagram
//
//  Created by Huynh Van Tuan on 13/06/2023.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    let post: Post
    var body: some View {
        VStack {
            // image + name
            HStack {
                CircularProfileImageView(user: post.user, size: .small)
                VStack(alignment: .leading) {
                    Text(post.user?.userName ?? "")
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                    Text(post.user?.fullName ?? "")
                        .font(.system(size: 12))
                }
                Spacer()
            }
            .padding(.leading, 8)
            //  post image
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())

            //  acction button
            HStack {
                Button {
                } label: {
                    Image(systemName: "heart")
                }
                Button {
                } label: {
                    Image(systemName: "bubble.right")
                }
                Button {
                } label: {
                    Image(systemName: "paperplane")
                }
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundColor(.black)
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            // like lable
            HStack {
                Text(post.user?.userName ?? "")
                    .fontWeight(.semibold) +
                    Text(" \(post.caption)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 1)
            // caption label
            Text("6h ago ")
                .font(.footnote)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MOCK_POST[0])
    }
}
