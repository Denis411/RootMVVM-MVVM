//
//  Repository.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 14/8/25.
//

import Foundation

protocol RepositoryProtocol {
    var isUserLoggedIn: Bool { get }
    func logInUser() async throws
    func logOutUser() async throws
}

final class Repository: RepositoryProtocol {
    private(set) var isUserLoggedIn: Bool = false
    
    func logInUser() async throws {
        isUserLoggedIn = true
    }
    
    func logOutUser() async throws {
        isUserLoggedIn = false
    }
    
}
