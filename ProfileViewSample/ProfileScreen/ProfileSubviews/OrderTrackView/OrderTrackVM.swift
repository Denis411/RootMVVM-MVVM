//
//  OrderTrackVM.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 14/8/25.
//

import Combine

final class OrderTrackVM: ObservableObject {
    private let repo: RepositoryProtocol
    @Published var isViewEmpty: Bool
    @Published var models = [
        OrderTrackModel(),
        OrderTrackModel(),
        OrderTrackModel(),
        OrderTrackModel(),
        OrderTrackModel()
    ]
    
    init(repo: RepositoryProtocol) {
        self.repo = repo
        self.isViewEmpty = !repo.isUserLoggedIn
        repo.addListener(self)
    }
}

extension OrderTrackVM: RepositoryUserListener {
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
