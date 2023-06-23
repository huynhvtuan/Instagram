//
//  AvartarView.swift
//  Instagram
//
//  Created by Huynh Van Tuan on 13/06/2023.
//

import SwiftUI

struct AvartarView: View {
    var imageName: String?
    var cornerCircle: CGFloat? = 80
    var body: some View {
        Image(imageName ?? "person_default")
            .resizable()
            .scaledToFill()
            .frame(width: cornerCircle, height: cornerCircle)
            .clipShape(Circle())
            .clipped()
            .overlay(RoundedRectangle(cornerRadius: cornerCircle ?? 80)
                .stroke(Color.gray, lineWidth: 1))
    }
}

struct AvartarView_Previews: PreviewProvider {
    static var previews: some View {
        AvartarView()
    }
}
