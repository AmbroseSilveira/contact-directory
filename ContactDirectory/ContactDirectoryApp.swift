//
//  ContactDirectoryApp.swift
//  ContactDirectory
//
//  Created by Ambrose Silveira on 17/05/25.
//

import SwiftUI

/// Main entry point for the application. Uses Dependency Injection for the services.
/// Sets the root navigation stack and manages user selection on the list screen to view detailed screen.
@main
struct ContactDirectoryApp: App {
    //MARK: State and Properties
    
    ///Holds the user selection on the User list screen for selected user
    @State private var selectedUser: User? = nil
    
    ///Shared network service request for the application
    private let networkService = NetworkService()
    
    ///User service for fetching User data
    private let userService: UserServiceProtocol
    
    //MARK: Initialiser
    
    ///Initialises the app and injects the network service for the Userservice
    init() {
        self.userService = UserService(networkService: networkService)
    }
    
    //MARK: Scene
    
    ///The main scene for the app deinfing Navigation and hierarchy of the views.
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                
                //Displays list of users
                UserListView(userViewModel: UserListViewModel<User> {
                    try await userService.fetchUsersData()
                }) { user in
                    //Handles user selection to navigate to DetailScreen
                    selectedUser = user
                }
                .navigationDestination(item: $selectedUser) { user in
                    UserDetailsView(user: user)
                }
            }
        }
    }
}
