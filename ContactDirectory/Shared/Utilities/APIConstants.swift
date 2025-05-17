//
//  APIConstants.swift
//  ContactDirectory
//
//  Created by Ambrose Silveira on 17/05/25.
//

import Foundation

/**
 APIConstants provides an unified location, managing all API-related constants
 */
struct APIConstants {
    /// Base URL for the API
    static let baseURL = "https://fake-json-api.mock.beeceptor.com"
    
    /// Contains collection of API endpoints.
    struct Endpoints {
        /// Endpoint for user profle data
        static let getUserData = "users"
    }
}
