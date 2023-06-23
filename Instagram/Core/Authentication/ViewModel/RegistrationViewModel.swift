//
//  RegistrationViewModel.swift
//  Instagram
//
//  Created by Huynh Van Tuan on 14/06/2023.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var fullName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""

    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, userName: userName,fullName: fullName)
        reset()
    }

    private func reset() {
        userName = ""
        email = ""
        password = ""
        fullName = ""
    }
}
