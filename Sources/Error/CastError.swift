//
//  CastError.swift
//  UserDefault
//
//  Created by Ben Shutt on 16/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// `Error` when casting a type
public enum CastError: Error {

    /// Failed to cast `object` to the required type
    case invalidCast(_ object: Any)
}

// MARK: - CastError + Helper

/// Cast `object` to `T` or throw `CastError`
/// 
/// - Parameter object: `Any` object to cast
/// - Throws: `CastError` on failed cast
/// - Returns: `T` cast of `object`
internal func castOrThrow<T>(_ object: Any) throws -> T {
    guard let obj = object as? T else { throw CastError.invalidCast(object) }
    return obj
}
