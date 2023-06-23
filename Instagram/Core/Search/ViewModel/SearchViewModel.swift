//
//  SearchViewModel.swift
//  Instagram
//
//  Created by Huynh Van Tuan on 14/06/2023.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()

    init() {
        Task {
            try await fetchAllUser()
        }
    }

    @MainActor
    func fetchAllUser() async throws {
        let users = try await UserService.fetchAllUser()
        self.users = users
    }
}
