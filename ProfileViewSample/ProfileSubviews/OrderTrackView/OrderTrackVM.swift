//
//  OrderTrackVM.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 14/8/25.
//

import Combine

final class OrderTrackVM: ObservableObject {
    @Published var models = [
        OrderTrackModel(),
        OrderTrackModel(),
        OrderTrackModel(),
        OrderTrackModel(),
        OrderTrackModel()
    ]
}
