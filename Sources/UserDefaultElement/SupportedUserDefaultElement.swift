//
//  UserDefaultElement+Defaults.swift
//  UserDefault
//
//  Created by Ben Shutt on 16/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// Confirm types which are already supported by the `UserDefaults`.
///
/// See https://developer.apple.com/documentation/foundation/userdefaults
public protocol SupportedUserDefaultElement: UserDefaultElement {
}

// MARK: - UserDefaultElement

/// Simply cast `UserDefaults` object to `Self` and vice versa
public extension SupportedUserDefaultElement {

    /// Simply cast `object` to `Self`
    ///
    /// - Parameter object: `Any` object returned from the `UserDefaults`
    static func read(object: Any) throws -> Self {
        return try castOrThrow(object)
    }

    /// Simply return `self`
    func write() throws -> Any {
        return self
    }
}

// MARK: - Defaults

// NSData
extension NSData: SupportedUserDefaultElement {}
extension Data: SupportedUserDefaultElement {}

// NSString
extension NSString: SupportedUserDefaultElement {}
extension String: SupportedUserDefaultElement {}

// NSNumber (taken from Initializing an NSNumber Object)
extension NSNumber: SupportedUserDefaultElement {}
extension Bool: SupportedUserDefaultElement {}
extension Int8: SupportedUserDefaultElement {}
extension Double: SupportedUserDefaultElement {}
extension Float: SupportedUserDefaultElement {}
extension Int32: SupportedUserDefaultElement {}
extension Int: SupportedUserDefaultElement {}
extension Int64: SupportedUserDefaultElement {}
extension Int16: SupportedUserDefaultElement {}
extension UInt8: SupportedUserDefaultElement {}
extension UInt32: SupportedUserDefaultElement {}
extension UInt: SupportedUserDefaultElement {}
extension UInt64: SupportedUserDefaultElement {}
extension UInt16: SupportedUserDefaultElement {}

// NSDate
extension NSDate: SupportedUserDefaultElement {}
extension Date: SupportedUserDefaultElement {}

// NSArray
// Warning: As with UserDefaults, make sure `Element` is valid
extension NSArray: SupportedUserDefaultElement {}
extension Array: SupportedUserDefaultElement {}

// NSDictionary
// Warning: As with UserDefaults, make sure `Key`, `Value` are valid
extension NSDictionary: SupportedUserDefaultElement {}
extension Dictionary: SupportedUserDefaultElement {}
