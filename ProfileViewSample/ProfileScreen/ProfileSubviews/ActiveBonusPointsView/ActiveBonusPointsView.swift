//
//  ActiveBonusPointsView.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 15/8/25.
//

import SwiftUI

struct ActiveBonusPointsView: View {
    @StateObject var vm: ActiveBonusPointsViewModel
    
    init(repo: RepositoryProtocol) {
        self._vm = StateObject(wrappedValue: ActiveBonusPointsViewModel(repo: repo))
    }
    var body: some View {
        if vm.isViewEmpty {
            EmptyView()
        } else {
            HStack {
                VStack(alignment: .leading) {
                    Text("Активные баллы")
                        .font(.title)
                    Text("\(vm.availableBonuses)")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundStyle(.green)
                }
                
                Spacer()
                
                Image(systemName: "giftcard")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(15)
        }
    }
}
