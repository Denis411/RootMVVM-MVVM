//
//  ProfileRootVM.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 14/8/25.
//

import Combine

class ProfileRootVM: ObservableObject {
    // MARK: - Actions
    func didTapFavoriteProducts() {
        print("Favorite products tapped")
    }
    
    func didTapLoyaltyProgramInfo() {
        print("Loyalty program info tapped")
    }
    
    func didTapGeolocation() {
        print("Geolocation tapped")
    }
    
    func didTapHelp() {
        print("Help tapped")
    }
    
    func didTapLegalInfo() {
        print("Legal info tapped")
    }
    
    func didTapSendResume() {
        print("Send resume tapped")
    }
}
