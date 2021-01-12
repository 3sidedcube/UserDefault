//
//  NotificationCenter+UserDefault.swift
//  UserDefault
//
//  Created by Ben Shutt on 12/01/2021.
//

import Foundation

// MARK: - Notification.Name

public extension Notification.Name {

    /// `Name` of the `Notification` which is posted when a `UserDefault` is set
    static let userDefaultDidSet = Notification.Name(
        "com.3sidedcube.userDefault.didSet"
    )
}

// MARK: - NotificationCenter

public extension NotificationCenter {

    /// Key in the `userInfo` of a `Notification` containing the `UserDefault`
    static let userDefaultDidSetKey =
        Notification.Name.userDefaultDidSet.rawValue + ".key"

    /// Post a `userDefault` on this `NotificationCenter`
    ///
    /// - Parameters:
    ///   - userDefault: `UserDefault<T>`
    ///   - object: `Any?`
    func post<T>(userDefault: UserDefault<T>, object: Any?) {
        post(
            name: .userDefaultDidSet,
            object: object,
            userInfo: [
                Self.userDefaultDidSetKey: userDefault
            ]
        )
    }

    /// Observe notifications posted about a `UserDefault<T>`
    ///
    /// - Parameters:
    ///   - object: `Any?`
    ///   - queue: `OperationQueue?`
    ///   - block: Closure to execute when a `UserDefault<T>` is posted
    func observeUserDefault<T>(
        object: Any? = nil,
        queue: OperationQueue? = .main,
        using block: @escaping (UserDefault<T>) -> Void
    ) -> NSObjectProtocol {
        return addObserver(
            forName: .userDefaultDidSet,
            object: object,
            queue: queue
        ) { sender in
            let object = sender.userInfo?[Self.userDefaultDidSetKey]
            guard let userDefault = object as? UserDefault<T> else { return }
            block(userDefault)
        }
    }
}
