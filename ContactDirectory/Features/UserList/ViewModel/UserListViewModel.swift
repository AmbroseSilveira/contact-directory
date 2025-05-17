//
//  UserListViewModel.swift
//  ContactDirectory
//
//  Created by Ambrose Silveira on 17/05/25.
//

import Foundation

//TODO: Add document comments
@Observable
final class UserListViewModel/*: ObservableObject*/ {
    
    var users: [User] = []
    var error: Error?
    private let userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    @MainActor
    func getUserProfiles() async {
        do {
            self.users = try await userService.fetchUsersData()
            // set to nil to revceive update after retry / refresh
            self.error = nil
        } catch {
            debugPrint("Error encountered:\(error.localizedDescription)")
            self.error = error
        }
    }
}
