//
//  IDTextFieldModifier.swift
//  Instagram
//
//  Created by Huynh Van Tuan on 13/06/2023.
//

import SwiftUI

struct IGTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
