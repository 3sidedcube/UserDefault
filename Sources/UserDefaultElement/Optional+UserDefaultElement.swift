//
//  UserDefaultElement+Optional.swift
//  UserDefault
//
//  Created by Ben Shutt on 16/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// Conform `Optional` to `UserDefaultElement` when `Wrapped` conforms
extension Optional: UserDefaultElement where Wrapped: UserDefaultElement {

    /// Return `nil` if `NSNull`, otherwise read `Wrapped`
    ///
    /// - Parameter object: `Any` object returned from the `UserDefaults`
    public static func read(object: Any) throws -> Wrapped? {
        guard !(object is NSNull) else { return .none }
        return .some(try Wrapped.read(object: object))
    }

    /// `NSNull` if `nil` otherwise write `Wrapped`
    public func write() throws -> Any {
        switch self {
        case .none: return NSNull()
        case .some(let element): return try element.write()
        }
    }
}
