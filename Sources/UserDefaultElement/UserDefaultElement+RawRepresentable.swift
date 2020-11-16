//
//  UserDefaultElement+RawRepresentable.swift
//  UserDefault
//
//  Created by Ben Shutt on 16/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// Define `UserDefaultElement` implementation when `Self` is `RawRepresentable`
public extension UserDefaultElement where
    Self: RawRepresentable,
    RawValue: SupportedUserDefaultElement {

    /// Cast `object` as `RawValue` and initialize with that `RawValue`
    ///
    /// - Parameter object: `Any` object returned from the `UserDefaults`
    static func read(object: Any) throws -> Self {
        // Cast to `RawValue`
        let rawValue: RawValue = try castOrThrow(object)

        // Read `RawValue`
        let entity = try Self.initialize(rawValue: rawValue)

        return entity
    }

    /// Write `rawValue`
    func write() throws -> Any {
        return rawValue
    }
}
