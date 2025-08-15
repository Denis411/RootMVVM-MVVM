//
//  ContentView.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 14/8/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm: ProfileRootVM
    
    init(repo: RepositoryProtocol) {
        self._vm = StateObject(wrappedValue: ProfileRootVM(repo: repo))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                RegistrationView(repo: vm.repo)
                
                ActiveBonusPointsView(repo: vm.repo)
                    .padding(.bottom, 25)
                
                OrderTrackView(repo: vm.repo)
                    .padding(.bottom, 25)
                
                ChevronView(
                    leftImage: Image(systemName: "cart"),
                    title: "Покупки"
                ) {
                    ChevronButton(text: "Избранные товары", action: vm.didTapFavoriteProducts)
                }
                
                ChevronView(
                    leftImage: Image(systemName: "creditcard.and.123"),
                    title: "Программа лояльности"
                ) {
                    ChevronButton(text: "О программе лояльности", action: vm.didTapLoyaltyProgramInfo)
                }
                
                ChevronView(
                    leftImage: Image(systemName: "location.fill"),
                    title: "Адрес"
                ) {
                    ChevronButton(text: "Геолокация", action: vm.didTapGeolocation)
                }
                
                ChevronView(
                    leftImage: Image(systemName: "envelope.fill"),
                    title: "Обратная связь"
                ) {
                    ChevronButton(text: "Помощь", action: vm.didTapHelp)
                    ChevronButton(text: "Правовая информация", action: vm.didTapLegalInfo)
                }
                
                ChevronView(
                    leftImage: Image(systemName: "backpack"),
                    title: "Работа у нас"
                ) {
                    ChevronButton(text: "Отправить резюме", action: vm.didTapSendResume)
                }
            }
            
            ProfileExitView(repo: vm.repo)
        }
        .background(Color.gray)
    }
}

#Preview {
    ContentView(repo: Repository())
}
