//
//  RegistrationViewModel.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 14/8/25.
//

import Combine

final class RegistrationViewModel: ObservableObject {
    @Published var isViewEmpty: Bool
    private let repo: RepositoryProtocol
    
    init(repo: RepositoryProtocol) {
        self.repo = repo
        self.isViewEmpty = repo.isUserLoggedIn
        repo.addListener(self)
    }
    
    func logInUser() {
        assert(isViewEmpty == false)
        Task { @MainActor in
            do {
                try await repo.logInUser()
            } catch {
                print("login error")
            }
        }
    }
}

extension RegistrationViewModel: RepositoryUserListener {
    func userDidLogIn() async {
        if isViewEmpty != true {
            await MainActor.run {
                isViewEmpty = true
            }
        }
    }
    
    func userDidLogOut() async {
        if isViewEmpty != false {
            await MainActor.run {
                isViewEmpty = false
            }
        }
    }
}
