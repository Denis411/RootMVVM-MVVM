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
    }
}
