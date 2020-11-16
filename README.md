# UserDefault
 Simple property wrapper of the `UserDefaults`.

## Example
Using the `UserDefault` `@propertyWrapper` allows you to cleanly keep your `UserDefaults` logic all in one place. 
What you can persist is not limited to the supported types outlined in the [User Defaults](https://developer.apple.com/documentation/foundation/userdefaults).
`Codable` conformance is provided. For example:

```swift
struct User: Codable: UserDefaultsElement { 
    // ... 
}
struct Animal: Codable: UserDefaultsElement { 
    // ... 
}

/// Set of entities stored in the `UserDefaults`
struct UserDefaultValues {

    @UserDefault("user", defaultValue: nil)
    static var user: User?

    @UserDefault("animal", defaultValue: .default)
    static var animal: Animal

    @UserDefault("age", defaultValue: 18)
    static var age: Int

    @UserDefault("isLoggedIn", defaultValue: false)
    static var isLoggedIn: Bool
``` 

## Acknowledgements
https://www.avanderlee.com/swift/property-wrappers/

