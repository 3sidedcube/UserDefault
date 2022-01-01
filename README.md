# UserDefault
Simple property wrapper of the [UserDefaults](https://developer.apple.com/documentation/foundation/userdefaults).

## Example
Using the `UserDefault` `@propertyWrapper` allows you to cleanly keep your `UserDefaults` logic all in one place. 
What you can persist is not limited to the supported types outlined in the [UserDefaults](https://developer.apple.com/documentation/foundation/userdefaults).
`Codable` conformance is provided. For example:

```swift
/// A user model
struct User: Codable: UserDefaultsElement {
    // ...
}

/// An animal model
struct Animal: Codable: UserDefaultsElement {

    /// Default `Animal` to return from the `UserDefaults`
    static var `default`: Animal {
        // ...
    }

    // ...
}

/// Set of entities stored in the `UserDefaults`
struct UserDefaultValues {

    /// Example of optional `Codable`
    @UserDefault("user", defaultValue: nil)
    static var user: User?

    /// Example of non-optional `Codable`
    @UserDefault("animal", defaultValue: .default)
    static var animal: Animal

    /// Example of `Int`
    @UserDefault("age", defaultValue: 18)
    static var age: Int

    /// Example of `Bool`
    @UserDefault("isLoggedIn", defaultValue: false)
    static var isLoggedIn: Bool
}
``` 

## Acknowledgements
https://www.avanderlee.com/swift/property-wrappers/

