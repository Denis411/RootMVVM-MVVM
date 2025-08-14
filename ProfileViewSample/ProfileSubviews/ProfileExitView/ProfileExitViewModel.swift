//
//  ProfileExitViewModel.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 14/8/25.
//

import Combine

final class ProfileExitViewModel: ObservableObject {
    @Published var isUserLoggedIn: Bool
    private let repo: RepositoryProtocol
    
    init(repo: RepositoryProtocol) {
        self.isUserLoggedIn = repo.isUserLoggedIn
        self.repo = repo
    }
    
    func exitAction() {
        Task { @MainActor in
            assert(isUserLoggedIn == true)
            do {
                try await repo.logOutUser()
            } catch {
                print("Something went wrong")
            }
        }
    }
}
