//
//  RawRepresentableError.swift
//  UserDefault
//
//  Created by Ben Shutt on 16/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// `Error` when working with `RawRepresentable`
public enum RawRepresentableError: Error {

    /// Failed to convert `rawValue` into a valid `RawRepresentable` case
    case rawValue(_ rawValue: Any)
}

internal extension RawRepresentable {

    /// Initialize a new instance of `Self` with the given `rawValue`.
    /// If `rawValue` results in a failed initializer then throw a `RawRepresentableError`
    /// 
    /// - Parameter rawValue: `RawValue` to initialize with
    /// - Throws: `RawRepresentableError` on failed init
    /// - Returns: `Self` instance from `rawValue`
    static func initialize(rawValue: RawValue) throws -> Self {
        guard let entity = Self(rawValue: rawValue) else {
            throw RawRepresentableError.rawValue(rawValue)
        }
        return entity
    }
}
