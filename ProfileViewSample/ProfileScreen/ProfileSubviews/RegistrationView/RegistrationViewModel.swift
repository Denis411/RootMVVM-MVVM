//
//  RegistrationViewModel.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 14/8/25.
//

import Combine

final class RegistrationViewModel: ObservableObject {
    @Published var isUserLoggedIn: Bool
    private let repo: RepositoryProtocol
    
    init(repo: RepositoryProtocol) {
        self.repo = repo
        self.isUserLoggedIn = repo.isUserLoggedIn
    }
    
    func logInUser() {
        assert(isUserLoggedIn == false)
        Task { @MainActor in
            do {
                try await repo.logInUser()
                isUserLoggedIn = true
            } catch {
                print("login error")
            }
        }
    }
}
