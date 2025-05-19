//
//  UserDataModel.swift
//  ContactDirectory
//
//  Created by Ambrose Silveira on 17/05/25.
//

import Foundation

/**
 User Model representing user information which is conforming to Decodable for easy decoding. It will map the reponse from the API call to the JSON.
 All properties are optional except ID to handle incomplete or empty data.
 */
struct User: Identifiable, Codable, Equatable, Hashable {
    
    let id: Int
    let name: String?
    let company: String?
    let username: String?
    let email: String?
    let address: String?
    let zip: String?
    let state: String?
    let country: String?
    let phone: String?
    let photo: String?
}
