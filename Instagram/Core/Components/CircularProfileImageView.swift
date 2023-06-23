//
//  CircularProfileImageView.swift
//  Instagram
//
//  Created by Huynh Van Tuan on 14/06/2023.
//

import Kingfisher
import SwiftUI

enum ProfileImageSize {
    case xSmall
    case small
    case medium
    case large

    var dimension: CGFloat {
        switch self {
        case .xSmall:
            return 45
        case .small:
            return 56
        case .medium:
            return 80
        case .large:
            return 100
        }
    }
}

struct CircularProfileImageView: View {
    let user: User?
    let size: ProfileImageSize
    var body: some View {
        if let imageUrl = user?.profileImgUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
                .overlay(RoundedRectangle(cornerRadius: size.dimension)
                    .stroke(Color.gray, lineWidth: 1))
        } else {
            AvartarView(cornerCircle: size.dimension)
        }
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(user: User.MOCK_USER[0], size: .medium)
    }
}
