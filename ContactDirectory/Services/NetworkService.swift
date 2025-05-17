//
//  NetworkService.swift
//  ContactDirectory
//
//  Created by Ambrose Silveira on 17/05/25.
//

import Foundation

//Easy testing and dependency injection
protocol UserServiceProtocol {
    func fetchUsersData() async throws -> [User]
}

//TODO: Add failsafe
class UserService: UserServiceProtocol {
    
    private let session: URLSession
    private let baseURL: String
    
    init(session: URLSession = .shared, baseURL: String = APIConstants.baseURL) {
        self.session = session
        self.baseURL = baseURL
    }
    
    func fetchUsersData() async throws -> [User] {
        //implementation
        //TODO: <create common method to form URLs based on endpoints?
        let urlString = baseURL + "/" + APIConstants.Endpoints.getUserData
        debugPrint("URL:\(urlString)")
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode([User].self, from: data)
    }
}
