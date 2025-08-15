//
//  OrderTrackVM.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 14/8/25.
//

import Combine

final class OrderTrackVM: ObservableObject {
    private let repo: RepositoryProtocol
    @Published var hasUser: Bool
    @Published var models = [
        OrderTrackModel(),
        OrderTrackModel(),
        OrderTrackModel(),
        OrderTrackModel(),
        OrderTrackModel()
    ]
    
    init(repo: RepositoryProtocol) {
        self.repo = repo
        self.hasUser = repo.isUserLoggedIn
        repo.addListener(self)
    }
}

extension OrderTrackVM: RepositoryListener {
    func userDidLogIn() async {
        if hasUser != true {
            await MainActor.run {
                hasUser = true
            }
        }
    }
    
    func userDidLogOut() async {
        if hasUser != false {
            await MainActor.run {
                hasUser = false
            }
        }
    }
}
