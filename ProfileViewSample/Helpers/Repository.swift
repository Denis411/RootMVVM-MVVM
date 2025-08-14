//
//  Repository.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 14/8/25.
//

import Foundation

protocol RepositoryListener: AnyObject {
    func userDidLogIn() async
    func userDidLogOut() async
}

protocol RepositoryProtocol {
    var isUserLoggedIn: Bool { get }
    func logInUser() async throws
    func logOutUser() async throws
    
    // I simplify everything because it is a prototype
    // But you will have to inject everything properly
    // splitting protocols could be a good idea too
    var userListeners: [Weak<AnyObject>] { get }
    func addListener(_ listener: RepositoryListener)
}

protocol LogInListener {
    func userDidLogIn()
    func userDidLogOut()
}

final class Repository: RepositoryProtocol {
    private(set) var isUserLoggedIn: Bool = false
    
    func logInUser() async throws {
        isUserLoggedIn = true
        for listener in userListeners {
            await (listener as? RepositoryListener)?.userDidLogIn()
        }
    }
    
    func logOutUser() async throws {
        isUserLoggedIn = false
        for listener in userListeners {
            await (listener as? RepositoryListener)?.userDidLogOut()
        }
    }
    
    // observation
    private(set) var userListeners: [Weak<AnyObject>] = []
    
    func addListener(_ listener: RepositoryListener) {
        let weakReference = Weak(value: listener as AnyObject)
        userListeners.append(weakReference)
    }
}

class Weak<T: AnyObject> {
    weak var value: T?

    init(value: T) {
        self.value = value
    }
}
