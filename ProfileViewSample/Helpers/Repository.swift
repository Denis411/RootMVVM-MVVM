//
//  Repository.swift
//  ProfileViewSample
//
//  Created by FIX PRICE on 14/8/25.
//

import Foundation

protocol RepositoryUserListener: AnyObject {
    func userDidLogIn() async
    func userDidLogOut() async
}

protocol RepositoryActivePointListener: AnyObject {
    func userDidIncreasePoints() async -> Int
    func userDidDecreasePoints() async -> Int
}

protocol RepositoryProtocol {
    //MARK: - User logic
    var isUserLoggedIn: Bool { get }
    func logInUser() async throws
    func logOutUser() async throws
    
    //MARK: - Bonus points
    var activePoints: Int { get }
    func increaseActivePoints(by number: Int) async
    func decreasePoints(by number: Int) async
    // MARK: - Observation
    // I simplify everything because it is a prototype
    // But you will have to inject everything properly
    // splitting protocols could be a good idea too
    var userListeners: [Weak<AnyObject>] { get }
    func addListener(_ listener: RepositoryUserListener)        // pay attention to dynamic polimorphism
    func addListener(_ listener: RepositoryActivePointListener) //
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
            await (listener.value as? RepositoryUserListener)?.userDidLogIn()
        }
    }
    
    func logOutUser() async throws {
        isUserLoggedIn = false
        for listener in userListeners {
            await (listener.value as? RepositoryUserListener)?.userDidLogOut()
        }
    }
    
    //MARK: - Bonus points
    private(set) var activePoints: Int = 0 {
        willSet {
            assert(newValue >= 0)
        }
    }
    
    func increaseActivePoints(by number: Int) async {
        // fix me: data race
        activePoints += number
    }
    
    func decreasePoints(by number: Int) async {
        activePoints -= number
    }
    
    // MARK: - Observation
    private(set) var userListeners: [Weak<AnyObject>] = []
    
    func addListener(_ listener: RepositoryUserListener) {
        let weakReference = Weak(value: listener as AnyObject)
        userListeners.append(weakReference)
    }
    
    func addListener(_ listener: any RepositoryActivePointListener) {
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
