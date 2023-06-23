//
//  LoginViewModel.swift
//  Instagram
//
//  Created by Huynh Van Tuan on 14/06/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""

    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
