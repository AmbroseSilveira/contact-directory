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
 
 The `CodingKeys` enum is used for customization of property names in the struct to map to keys in external JSON. It is useful in cases where the property name differs from the key in the data source.
 
 For example, the `userID` property is mapped to the `"id"` key in JSON using `case userID = "id"`.
 */
// identifiable so taht it can be populated in lsit as paraemeter else will throw error
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
    
    /*
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case company
        case username
        case email
        case address
        case zip
        case state
        case country
        case phone
        case photo
    }
     */
}
