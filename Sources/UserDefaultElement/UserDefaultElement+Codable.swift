//
//  UserDefaultElement+Codable.swift
//  UserDefault
//
//  Created by Ben Shutt on 16/11/2020.
//  Copyright © 2020 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import Foundation

/// Define `UserDefaultElement` implementation when `Self` is `Codable`
public extension UserDefaultElement where Self: Codable {

    /// Cast `object` as `Data` and use `JSONDecoder` to decode `Self`
    ///
    /// - Parameter object: `Any` object returned from the `UserDefaults`
    static func read(object: Any) throws -> Self {
        let data: Data = try castOrThrow(object)
        return try JSONDecoder().decode(Self.self, from: data)
    }

    /// Use `JSONEncoder` to encode `self`
    func write() throws -> Any {
        return try JSONEncoder().encode(self)
    }
}
