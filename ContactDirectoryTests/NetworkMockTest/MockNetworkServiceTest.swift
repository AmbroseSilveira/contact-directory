//
//  MockNetworkServiceTest.swift
//  ContactDirectoryTests
//
//  Created by Ambrose Silveira on 19/05/25.
//

import Foundation
import Testing

@testable import ContactDirectory

// MARK: - Mock Network Service

final class MockNetworkService: NetworkServiceProtocol {
    
    var testEndpoint: String?
    var testMethod: HTTPMethod?
    var result: Any?
    var error: Error?
    
    func request<T: Decodable>(endpoint: String, method: HTTPMethod, body: Data?,headers: [String : String]?) async throws -> T {
        testEndpoint = endpoint
        testMethod = method
        
        if let error = error {
            throw error
        }
        
        guard let result = result as? T else {
            fatalError("MockNetworkService: mismatch in result type")
        }
        
        return result
    }
}

// MARK: - Model for testing

//struct User: Decodable, Equatable, Identifiable {
//
//    let id: Int
//    let name: String?
//    let company: String?
//    let username: String?
//    let email: String?
//    let address: String?
//    let photo: String?
//}

// MARK: - Unit Tests with Swift Testing DSL

struct UserServiceTests {
    @Test
    func fetches_users_successfully() async throws {

        //Mock dat for user
        let expectedUsers = [
            User(id: 1, name: "rose", company: "abc inc", username: "rose101", email: "rose1@mail.com", address: "street 1", zip: "560123", state: "KA", country: "India", phone: "123456789", photo: "https://xyz.com/foto.jpg"),
            User(id: 2, name: "Manny", company: "xyz inc", username: "manny1", email: "manny1@mail.com", address: "street 3", zip: "560123", state: "KA", country: "India", phone: "123456799", photo: "https://xyz.com/foto.jpg") ]
        
        let mockNetworkService = MockNetworkService()
        mockNetworkService.result = expectedUsers
        let userService = UserService(networkService: mockNetworkService)
        
        let users = try await userService.fetchUsersData()
        
        #expect(users.count == 2, "Should fetch two users")
        #expect(users.first?.name == "rose", "First user's name should be rose")
        #expect(users.last?.name == "Manny", "Second user's name should be Manny")
        #expect(mockNetworkService.testEndpoint == APIConstants.Endpoints.getUserData)
        #expect(mockNetworkService.testMethod == .get)
    }
    
    @Test
    func throws_on_network_error() async throws {
        // Mock data
        struct MockError: Error {}
        let mockNetworkService = MockNetworkService()
        mockNetworkService.error = MockError()
        let userService = UserService(networkService: mockNetworkService)
        
        await #expect(throws: MockError.self) {
            try await userService.fetchUsersData()
        }
    }
}
