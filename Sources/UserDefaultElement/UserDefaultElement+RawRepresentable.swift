//
//  UserDefaultElement+RawRepresentable.swift
//  UserDefault
//
//  Created by Ben Shutt on 16/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// Define `UserDefaultElement` implementation when `Self` is `RawRepresentable`
public extension UserDefaultElement
    where Self: RawRepresentable, RawValue: SupportedUserDefaultElement {

    // MARK: - RawRepresentable

    /// Cast `object` as `RawValue` and initialize with that `RawValue`
    ///
    /// - Parameter object: `Any` object returned from the `UserDefaults`
    /// - Returns: `Self`
    static func readRawRepresentable(object: Any) throws -> Self {
        // Cast to `RawValue`
        let rawValue: RawValue = try castOrThrow(object)

        // Read `RawValue`
        let entity = try Self.initialize(rawValue: rawValue)

        return entity
    }

    /// Write `rawValue`
    /// - Returns: `Any`
    func writeRawRepresentable() throws -> Any {
        return rawValue
    }

    // MARK: - UserDefaultElement

    /// Alias to `readRawRepresentable(object:)`
    ///
    /// - Parameter object: `Any`
    /// - Returns: `Self`
    static func read(object: Any) throws -> Self {
        return try readRawRepresentable(object: object)
    }

    /// Alias to `writeRawRepresentable()`
    /// - Returns: `Any`
    func write() throws -> Any {
        return try writeRawRepresentable()
    }
}

// MARK: - RawRepresentable + Codable

/// Extension required to handle an entity which conforms to both:
/// - `RawRepresentable`
/// - `Codable`
/// Otherwise conforming to `UserDefaultElement` raises an error as Swift doesn't know which
/// implementation to use.
public extension UserDefaultElement
    where Self: RawRepresentable, RawValue: SupportedUserDefaultElement, Self: Codable {

    /// Alias to `readRawRepresentable(object:)`
    ///
    /// - Parameter object: `Any`
    /// - Returns: `Self`
    static func read(object: Any) throws -> Self {
        return try readRawRepresentable(object: object)
    }

    /// Alias to `writeRawRepresentable()`
    /// - Returns: `Any`
    func write() throws -> Any {
        return try writeRawRepresentable()
    }
}
