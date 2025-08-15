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
        repo.addListener(self)
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

extension RegistrationViewModel: RepositoryListener {
    func userDidLogIn() async {
        if isUserLoggedIn != true {
            await MainActor.run {
                isUserLoggedIn = true
            }
        }
    }
    
    func userDidLogOut() async {
        if isUserLoggedIn != false {
            await MainActor.run {
                isUserLoggedIn = false
            }
        }
    }
}
