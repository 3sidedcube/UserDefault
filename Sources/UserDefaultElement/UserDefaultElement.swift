//
//  UserDefaultsElement.swift
//  UserDefault
//
//  Created by Ben Shutt on 16/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// Define functionality for reading and writing an object in the `UserDefaults`.
///
/// Some types will conform to this `protocol` as a result of conforming to another protocol,
/// e.g. `Codable`. These `protocol`s define enough already in order to implement this.
///
/// Some types are already supported by `UserDefaults`.
/// Their implementation should be simply cast by conforming to `SupportedUserDefaultElement`.
public protocol UserDefaultElement {

    /// Convert the given `UserDefaults` `object` into an instance of `Self`
    /// 
    /// - Parameter object: `Any` object returned from the `UserDefaults`
    static func read(object: Any) throws -> Self

    /// Write instance of `Self` into a `UserDefaults` object
    func write() throws -> Any
}
