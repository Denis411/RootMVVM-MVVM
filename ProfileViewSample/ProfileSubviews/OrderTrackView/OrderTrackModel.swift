//
//  OrderTrackModel.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 14/8/25.
//

import Foundation

extension OrderTrackVM {
    struct OrderTrackModel: Identifiable {
        var state = "Приняли"
        var orderName: String = "Заказ №120080 от 05.08.2025"
        var id = UUID().uuidString
        var description: String = "Самовывоз из магазина"
    }
}
