//
//  UserService.swift
//  ContactDirectory
//
//  Created by Ambrose Silveira on 18/05/25.
//

import Foundation

///Protocol for User related API. Can add more User related methods here as project scales
protocol UserServiceProtocol {
    
    /// Fetches a list of Users asynchronously and throws an error in case of error encountered if any.
    /// - Returns: An array of `User` objects.
    func fetchUsersData() async throws -> [User]
}

/// Implementaiton class for User srevices
final class UserService: UserServiceProtocol {
    
    //MARK: Properties
    
    ///Network service to make API request
    private let networkService: NetworkServiceProtocol
    
    //MARK: Initialiser
    
    ///Initialise a new user service
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    //MARK: Methods
    
    ///Fetch thr User list with API call
    func fetchUsersData() async throws -> [User] {
        
        //call the API method to fetch users list
        try await networkService.request(endpoint: APIConstants.Endpoints.getUserData, method: .get, body: nil, headers: nil)
    }
}
