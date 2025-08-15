//
//  ProfileExitViewModel.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 14/8/25.
//

import Combine

final class ProfileExitViewModel: ObservableObject {
    @Published var isViewEmpty: Bool
    private let repo: RepositoryProtocol
    
    init(repo: RepositoryProtocol) {
        self.isViewEmpty = !repo.isUserLoggedIn
        self.repo = repo
        repo.addListener(self)
    }
    
    func exitAction() {
        Task { @MainActor in
            assert(isViewEmpty == false)
            do {
                try await repo.logOutUser()
            } catch {
                print("Something went wrong")
            }
        }
    }
}

extension ProfileExitViewModel: RepositoryUserListener {
    func userDidLogIn() async {
        if isViewEmpty != false {
            await MainActor.run {
                isViewEmpty = false
            }
        }
    }
    
    func userDidLogOut() async {
        if isViewEmpty != true {
            await MainActor.run {
                isViewEmpty = true
            }
        }
    }
}
