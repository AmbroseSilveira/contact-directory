//
//  ProfileRowViewUnit_ViewInspectorTest.swift
//  ContactDirectoryTests
//
//  Created by Ambrose Silveira on 19/05/25.
//

import SwiftUI
import ViewInspector
import Testing

@testable import ContactDirectory

//MARK: Unit test suite

struct ProfileRowViewTests {
    
    @Test
    func testImageNameEmailSetup() {
        let profileRowView = ProfileRowView(user: User(id: 1, name: "Jane", company: "ABC", username: "Jane12", email: "jane12@abc.com", address: "Downtown", zip: "58323", state: "NY", country: "USA", phone: "9876543210", photo: "https://somurl/photo.jpg"))
        #expect(profileRowView.user.name == "Jane")
        #expect(profileRowView.user.email == "jane12@abc.com")
        #expect(profileRowView.user.photo == "https://somurl/photo.jpg")
    }
}

//MARK: View inspector unit test suite

struct ProfileViewInspectorTest {
    
    @Test
    @MainActor
    func testDisplayNameAndEmail() throws {
        let view = ProfileRowView(user: User(id: 1, name: "Jane", company: "ABC", username: "Jane12", email: "jane12@abc.com", address: "Downtown", zip: "58323", state: "NY", country: "USA", phone: "9876543210", photo: "https://somurl/photo.jpg"))
        let hStack = try view.inspect().hStack()
        //since the name and email are inside VStack
        let vStack = try hStack.vStack(1)
        let nameText = try vStack.text(0).string()
        let emailText = try vStack.text(1).string()
        
        #expect(nameText == "Jane")
        #expect(emailText == "jane12@abc.com")
    }
}
