//
//  OrderTrackView.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 14/8/25.
//

import SwiftUI

struct OrderTrackView: View {
    @StateObject private var vm = OrderTrackVM()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 20) {
                ForEach(vm.models) { model in
                    Cell(
                        model: model,
                        isOpen: false
                    )
                    .cornerRadius(15)
                }
            }
        }
    }
}
