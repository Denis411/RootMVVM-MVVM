//
//  ProfileViewSampleApp.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 14/8/25.
//

import SwiftUI

@main
struct ProfileViewSampleApp: App {
    // Use DI
    private let repo: RepositoryProtocol = Repository()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
