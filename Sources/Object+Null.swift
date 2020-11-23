//
//  Object+Null.swift
//  UserDefault
//
//  Created by Ben Shutt on 23/11/2020.
//

import Foundation

/// Should the given `object` be considered as`nil`
///
/// - Parameter object: `Any` object
func isNull(_ object: Any) -> Bool {
    if object is NSNull {
        return true
    } else if case Optional<Any>.none = object {
        return true
    }

    return false
}
