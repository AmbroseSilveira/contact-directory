//
//  APIConstantsTest.swift
//  ContactDirectoryTests
//
//  Created by Ambrose Silveira on 18/05/25.
//

import Testing
@testable import ContactDirectory

///Test API Constants
struct APIConstantsTest {
    
    @Test
    func TestBaseURL() {
        #expect(APIConstants.baseURL == "https://fake-json-api.mock.beeceptor.com")
    }
    
    @Test
    func TestUserServiceEndpoint() {
        #expect(APIConstants.Endpoints.getUserData == "users")
    }
}

///Test HTTP methods
struct HTTPMethodValues {
    @Test
    func TestHTTPMethods() {
        #expect(HTTPMethod.get.rawValue == "GET")
        #expect(HTTPMethod.post.rawValue == "POST")
        #expect(HTTPMethod.put.rawValue == "PUT")
        #expect(HTTPMethod.delete.rawValue == "DELETE")
    }
}

