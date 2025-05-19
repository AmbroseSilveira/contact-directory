//
//  NetworkService.swift
//  ContactDirectory
//
//  Created by Ambrose Silveira on 17/05/25.
//

import Foundation

//MARK: Network service protocol

///Protocol for reusable, generic networking call with HTTP request.
///Helps in easy testing and dependency injection
protocol NetworkServiceProtocol {
    /**
     Function to make an API request  asynchronously and throws error in case of errors.
     - Parameters
     - endpoint: Endpoint path to be appended to the base URL.
     - method: HTTP method type. e.g.: GET, POST, etc.
     - body: Body of the request of type `Data`, if any.
     - headers: Headers for the request.
     - Returns: Datamodel of generic type which conforms to `Decodable`.
     - Throws: Error incase of failure
     */
    func request<T:Decodable>(endpoint: String, method: HTTPMethod, body: Data?, headers: [String: String]?) async throws -> T
}

//MARK: Network request implementation

/**
 Class is responsible for making HTTP service calls with `URLSession` by providing generic `request`.
 */
final class NetworkService: NetworkServiceProtocol {
    
    //MARK: Properties
    
    private let session: URLSession
    private let baseURL: String
    
    //MARK: Initialiser
    
    init(session: URLSession = .shared, baseURL: String = APIConstants.baseURL) {
        self.session = session
        self.baseURL = baseURL
    }
    
    //MARK: Methods
    
    //Makes an API request to the specified endpoint and decodes the response
    func request<T>(endpoint: String, method: HTTPMethod, body: Data?, headers: [String : String]?) async throws -> T where T : Decodable {
        
        //Validate url else throw bad URL error
        guard let url = URL(string: "\(baseURL)/\(endpoint)") else {
            throw URLError(.badURL)
        }
        
        //Form URL request
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        
        headers?.forEach { request.setValue($1, forHTTPHeaderField: $0) }
        
        let (data, response) = try await session.data(for: request)
        
        //Fail-safe for HTTP response and success status code
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        //Decode and return the Decodable object of type `T`
        return try JSONDecoder().decode(T.self, from: data)
    }
}
