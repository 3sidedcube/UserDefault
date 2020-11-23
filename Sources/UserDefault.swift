//
//  UserDefault.swift
//  UserDefault
//
//  Created by Ben Shutt on 16/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// Read and write an entity of type `T` in the `UserDefaults` for `key`
@propertyWrapper
public struct UserDefault<T> where T: UserDefaultElement {

    /// `String` key to save valye `T` against in the `UserDefaults`
    public let key: String

    /// Default value of `T` when no entity exits or can not be cast to `T`
    public let defaultValue: T

    /// Default memberwise initializer
    ///
    /// - Parameters:
    ///   - key: `String`
    ///   - defaultValue: `T`
    public init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    /// Get and set `T` in the `UserDefaults`
    public var wrappedValue: T {
        get {
            do {
                let object = UserDefaults.standard.object(forKey: key)
                guard let obj = object else { return defaultValue }
                return try T.read(object: obj)
            } catch {
                // Error silenced to keep `wrappedValue` a get/set
                debugPrint(error)
                return defaultValue
            }
        }
        set {
            do {
                let object = try newValue.write()
                if isNull(object) {
                    UserDefaults.standard.removeObject(forKey: key)
                } else {
                    UserDefaults.standard.set(object, forKey: key)
                }
            } catch {
                // Error silenced to keep `wrappedValue` a get/set
                debugPrint(error)
            }
        }
    }
}
