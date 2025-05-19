//
//  UserListView.swift
//  ContactDirectory
//
//  Created by Ambrose Silveira on 17/05/25.
//

import SwiftUI

/**
 Displays the list of users fetched from a remote URL, with support for searching the users using a `Search Bar` and reload the user list using `Pull-To-Refresh` feature.
 */
struct UserListView: View {
    
    //MARK: Properties
    
    ///The view model object that manages the list of users.
    @Bindable var userViewModel: UserListViewModel<User>
    
    ///Stores the current text entered in the search bar.
    @State private var searchText: String = ""
    
    /// Action to perform when a user row is selected.
    var onSelect: (User) -> Void
    
    ///Returns the list of users filtered using the search text from the search bar. Removes faker user with error string
    var filteredUsers: [User] {
        let validUsers = userViewModel.users.filter { user in
            // Exclude users whose name contains the error string since its fake list
            guard let name = user.name else { return false }
            
            return !name.contains(AppConstants.ErrorMessages.errorString)
        }
        if searchText.isEmpty {
            return validUsers
        } else {
            return validUsers.filter { user in
                (user.name ?? "").localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    //MARK: Body
    
    var body: some View {
        NavigationView {
            Group {
                if let _ = userViewModel.error {
                    ErrorView(message: AppConstants.ErrorMessages.dataLoadingError, retryAction: {
                        Task {
                            await userViewModel.fetchData()
                        }
                    })
                } else if userViewModel.users.isEmpty {
                    ProgressView(AppConstants.UserMessages.loadingMessage)
                        .progressViewStyle(.circular)
                } else {
                    List(filteredUsers) { user in
                        Button(action: { onSelect(user) }) {
                            ProfileRowView(user: user)
                        }
                    }
                    .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic))
                    .refreshable(action: {
                        await userViewModel.fetchData()
                    })
                }
            }
            .navigationTitle(AppConstants.UIMessages.userListNavigationTitle)
        }
        .task {
            await userViewModel.fetchData()
        }
    }
}
