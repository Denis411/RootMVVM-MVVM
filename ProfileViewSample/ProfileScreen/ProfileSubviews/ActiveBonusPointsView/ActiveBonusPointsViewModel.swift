//
//  ActiveBonusPointsViewModel.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 15/8/25.
//

import Combine

final class ActiveBonusPointsViewModel: ObservableObject {
    @Published var isViewEmpty: Bool
    @Published var availableBonuses: Int
    private let repo: RepositoryProtocol
    
    init(repo: RepositoryProtocol) {
        self.isViewEmpty = !repo.isUserLoggedIn
        self.availableBonuses = repo.activePoints
        self.repo = repo
        repo.addListener(self as RepositoryUserListener)
        repo.addListener(self as RepositoryActivePointListener)
    }
}

extension ActiveBonusPointsViewModel: RepositoryUserListener {
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

extension ActiveBonusPointsViewModel: RepositoryActivePointListener {
    func userDidIncreasePoints(newValue: Int) async {
        if availableBonuses != newValue {
            await MainActor.run {
                availableBonuses = newValue
            }
        }
    }
    
    func userDidDecreasePoints(newValue: Int) async {
        if availableBonuses != newValue {
            await MainActor.run {
                availableBonuses = newValue
            }
        }
    }
}
