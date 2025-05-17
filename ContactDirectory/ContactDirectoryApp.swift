//
//  ContactDirectoryApp.swift
//  ContactDirectory
//
//  Created by Ambrose Silveira on 17/05/25.
//

import SwiftUI

@main
struct ContactDirectoryApp: App {
    @State private var selectedUser: User? = nil
    @State private var viewModel = UserListViewModel(userService: UserService())
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                UserListView(userViewModel: viewModel) { user in
                    selectedUser = user
                }
                .navigationDestination(item: $selectedUser) { user in
                    //TODO: pass data during details view implementation
                    UserDetailsView()
                }
            }
        }
    }
}
