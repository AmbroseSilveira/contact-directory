//
//  UserListViewModel.swift
//  ContactDirectory
//
//  Created by Ambrose Silveira on 17/05/25.
//

import Foundation

/// A generic view model for managing and fetching list of users from remote API.
/// Facilitates asynchronous data fetching and error handling for generic model type - `T`
/// The class is marked as `Observable` wih swift macro feature which automatically observation of properties and changes and does not explictly need `@Published` properties or `ObservableObject` conformance.
/// 
@Observable
class UserListViewModel<T: Identifiable & Decodable> {
    
    //MARK: Properties
    
    ///Stores list of Users of Generic Type `T`. Updated on successful completion of `fetchData()`.
    var users: [T] = []
    
    ///Error associated with fetch user list, if any.
    var error : Error?
    
    ///Closure hadling fetching user list asynchronously
    private let fetchCompletionClosure: () async throws -> [T]
    
    //MARK: Initialisation
    
    /// Initialises a new `UserListViewModel`
    /// - Parameter fetchCompletionClosure: Closure returning  array of generic Type.
    init(fetchCompletionClosure: @escaping () async throws -> [T]) {
        self.fetchCompletionClosure = fetchCompletionClosure
    }
    
    //MARK:  Methods
    
    /// Fetches User data and updates the users and error properties.
    /// If explicitly called, error is to be set to nil for success, to update the list. e.g: retry operation
    @MainActor
    func fetchData() async {
        do {
            self.users = try await fetchCompletionClosure()
            self.error = nil
        } catch {
            self.error = error
        }
    }
}
