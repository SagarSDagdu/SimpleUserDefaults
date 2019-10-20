# SimpleUserDefaults
A simple user defaults helper class in Swift which makes the use of Property Wrapper introduced in Swift 5.1 (Reference : https://docs.swift.org/swift-book/LanguageGuide/Properties.html) concept to simplify the use of ````UserDefaults````

## Example Usage
1. Create a struct which contains the UserDefaults for your app. You can store all the default types as well as custom types which conform to Codable. An example of the such struct is :

````
/// This struct is a sample of how to use the UserDefaultsStorage class to store and get UserDefaults in your app.

struct Settings {

    /// Determines whether the user is logged in
    
    @UserDefaultsStorage(key: "isUserLoggedIn")
    static var isUserLoggedIn: Bool? // Built-in type

    /// The logged in user details
    
    @UserDefaultsStorage(key: "loggedInUserDetails")
    static var loggedInUserDetails: UserDetails? //Custom type
}
````
### Saving

````
// Save a boolean
Settings.isUserLoggedIn = false

//Save a custom type
var dummyUser = UserDetails(id: 1, name: "Sagar", address: "Pune")
Settings.loggedInUserDetails = dummyUser

````

### Getting Values

````
if let isUserLoggedIn = Settings.isUserLoggedIn, isUserLoggedIn {
    print("User is logged in")
    let user = Settings.loggedInUserDetails
    print("Username is \(user?.name)")
}
