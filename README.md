# ContactDirectory
ContactDirectory is a basic iOS app built with SwiftUI that allows browsing the contact details of the people by displaying user profiles from a remote API. The app features two main screens: 
**1. List of users
  2. Detailed view for each of the user**

---

## Table of Contents

- [ContactDirectory](#contactdirectory)
- [Features](#features)
- [Technologies](#technologies-in-the-making)
- [Tech Features and Principles Used](#tech-features-and-principles-used)
- [Architecture](#architecture)
- [Project File Structure](#project-file-structure)
- [Setup, Runtime Environment & Usage](#setup--runtime-environment--&--usage)
- [App Screens](#app-screens)
- [Test Cases](#test-cases)
- [Assumptions](#assumptions)
- [Improvements](#improvements)
- [Known Issues](#known-issues)
- [References](#references)

---

## Features

- **User List Screen:** Displays a searchable list of users fetched from a remote API. The list displays name, email and photo of the user. The list offers refreshable list with pull down to refresh feature. 
- **User Detail Screen:** Displays detailed information of the selected user. The screen is divided into Sections - Personal Information, Contact, Address and displays user profile image.

---

## Technologies in the making

- **Xcode 16.3**
- **SwiftUI**
- **Swift**
- **Swift DSL for Unit Testing with View Inspector**
- **XCTest for UI Testing**
- **Swift Package Manager to add dependencies**
- **[View Inspector](https://github.com/nalexn/ViewInspector) package**

---

## Tech features and principles used

- **Dependency Injection** for testing and flexibilty
- **SOLID principles**
- **Generics** for testability, reusability and scalibility
- **Reusable** components
- **Observation**
- **Async/Await** - for ansynchronous and concurrency
- **Swift packages**
- **Unit Test and UI Test** with latest Swift DSL, ViewInspector and XCTest

---

## Architecture

- The app follows modular anf granular architecture for each of the features and components.
- MVVM is used for separating Presentation, Data and ViewModel layers.
- Observation is implemented to handle and detect changes and to reflect in the UI.
- SOLID principles, Generics and Dependency Injection is followed as design patterns and principles.
- Each features is kept in separate folder / group with each having its own Data, Presentation and ViewModel layer.
- Utilities contain reusable and common constants thoughout the app
- Network and Service protocols and implementation is kept as generic and resuable.

---

## Project File structure

```
ContactDirectory/
└── ContactDirectory/
    ├── Features/
    │   ├── UserDetails/
    │   │   └── View/
    │   │       └── UserDetailsView
    │   └── UserList/
    │       ├── Model/
    │       │   └── UserDataModel
    │       ├── View/
    │       │   └── UserListView
    │       └── ViewModel/
    │           └── UserListViewModel
    ├── Services/
    │   ├── NetworkService
    │   └── UserService
    ├── Shared/
    │   ├── CommonUI/
    │   │   ├── DetailItemRow
    │   │   ├── ErrorView
    │   │   ├── ProfileImageView
    │   │   └── ProfileRowView
    │   └── Utilities/
    │       ├── APIConstants
    │       └── AppConstants
    ├── Assets/
    └── ContactDirectoryApp
ContactDirectoryTests/
ContactDirectoryUITests/

|-- 📦 Package Dependencies
```

---

## Setup, Runtime environment and Usage

1. **Clone the repository** and used Xcode to open the `.xcodeproj`.
2. **Swift Package Build** wait for the package to resolve and install.
3. **Build and run** the app using iPhone device or sumulator
4. Wait for the list **to load** and tap on any row to open detailed screen.
5. On Main screen **Pull-To-Refresh** the content.
6. Use the **Search Bar** to filter the users by name.

---

## App Screens

<img src="https://github.com/user-attachments/assets/c62b6a23-c98d-4db0-bd3d-3cbcf7ac0606" alt="UserList" width="200">
<img src="https://github.com/user-attachments/assets/3f37aacd-f9b5-4e2b-9761-769f1d32a50f" alt="User Detail" width="200">
<img src="https://github.com/user-attachments/assets/3ca2ae51-a17a-4804-a056-61789efd6f1f" alt="Retry" width="200">

---

## Test cases

- The app contains both UnitTest cases and UI Test cases for code coverage. 
1. **Unit Test Cases** 
    - Unit Test cases for the app are written with Swift DSL support. Unit Test cases also contain ViewInspector support for unit testing view hierarchy using Swift package - ViewInspector.
2. **UI Test Cases**
    - UI Test cases are written with XCTest framework. 
> **Note:**  
> Basic test case suite is added for the assignment purpose.

---

## Assumptions

- The API returns an Array of user object with some optional fields.
- Error handling is basic for demo purpose. Retry Logic is included.
- The app is designed for demonstration and as basic implementation. More changes can be added to the design, architecture and coding pattern while designing the app.

---

## Improvements

- Use **LazyContainer like LazyVstack, LazyHStack** for data display. used basic for assignment. Implement **pagination and background data fetches** for huge data sizes.
- Images downloaded can be **cached** and reloaded for faster support.
- Data can be stored in the **storages** like coredata, swiftdata, etc. for offline support.
- Add **Reachability** for network and error handling
- Can implement **corrupt or fake data (e.g: Faker data) handling** with more understanding of the JSON data.
- **Test cases can be improved** upon and code coverage can be increased. Testcases for `AppConstants` and UI, network and service must be added and improved.
- Should add **swift lint** framework for linting.
- Can add **Extensions** for custom logid. e.g.: parsing a string for error.
- Better **Error Handling** and error-mapping.
- Can user `@Statobject` and `@ObservedObject` with `@Publish` for compatibility.
- Newtorking can have **Logging** for debugging.
- Can make **swift packages for networking** and other reusbale components for modularity.

---

## Known Issues

- Some user images may not load due to API limitations.
- Error messages and handling is basic and cab be improved.
- Some Test cases are failing and can be made 100% success with additional efforts. Some test cases are intermittently failing specially for UI

---

## References

- [Apple Swift UI Learning](https://developer.apple.com/tutorials/swiftui/)
- [Swift UI guide](https://www.swift.org/getting-started/swiftui/)
- [Swift UI ViewInspector test cases](https://github.com/nalexn/ViewInspector)
- [Swift DSL Testing](https://developer.apple.com/videos/play/wwdc2024/10179/)

> **Note:**  
> The complete commit history is available in the `development` branch. The `main` branch contains only final MVP which is shared.
