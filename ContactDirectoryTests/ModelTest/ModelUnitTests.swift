//
//  ModelUnitTests.swift
//  ContactDirectoryTests
//
//  Created by Ambrose Silveira on 18/05/25.
//

import Foundation
import Testing
@testable import ContactDirectory

struct ModelUnitTests {
    
    @Test func testUserInitialisation() async throws {
        let user = User(
            id: 1,
            name: "Jay Novick",
            company: "XYZ.com",
            username: "JayN",
            email: "jay.novick@example.com",
            address: "72 5th Cross",
            zip: "12345",
            state: "GA",
            country: "India",
            phone: "987-654-3210",
            photo: "samplePhoto.jpg")
        
        //Test
        #expect(user.id == 1)
        #expect(user.name == "Jay Novick")
        #expect(user.company == "XYZ.com")
        #expect(user.email == "jay.novick@example.com" )
        //change value for failure
        #expect(user.address == "72 5th Cross")
        #expect(user.zip == "12345")
        #expect(user.state == "GA")
        #expect(user.country == "India")
        #expect(user.phone == "987-654-3210")
        #expect(user.photo == "samplePhoto.jpg")
    }
    
    @Test
    func testCodableConformance() async throws {
        let user = User(
            id: 2,
            name: "Jane Nora",
            company: "ABC LLc",
            username: "JaneIck",
            email: "jane.nora@example.com",
            address: "123 Main Street",
            zip: "12345",
            state: "CA",
            country: "USA",
            phone: "987-654-3210",
            photo: "samplePhoto2.jpg")
        
        //encode
        let data = try JSONEncoder().encode(user)
        
        //decode
        let decodedData = try JSONDecoder().decode(User.self, from: data)
        
        #expect(user == decodedData)
    }
    
    @Test
    func testEquatableAndHashable() {
        let user1 = User(id: 3, name: "ABC", company: "JComp", username: nil, email: nil, address: nil, zip: nil, state: nil, country: nil, phone: nil, photo: nil)
        let user2 = User(id: 3, name: "ABC", company: "JComp", username: nil, email: nil, address: nil, zip: nil, state: nil, country: nil, phone: nil, photo: nil)
        let user3 = User(id: 4, name: "XYZ", company: "BComp", username: nil, email: nil, address: nil, zip: nil, state: nil, country: nil, phone: nil, photo: nil)
        #expect(user1 == user2)
        #expect(user1 != user3)
        //checks unique elements -> since user1 & user2 are same, is 1
        #expect(Set([user1, user2, user3]).count == 2)
    }
}
