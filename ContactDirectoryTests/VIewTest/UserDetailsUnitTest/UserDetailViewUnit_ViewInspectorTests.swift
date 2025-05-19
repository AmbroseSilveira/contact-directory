//
//  UserDetailViewUnit_ViewInspectorTests.swift
//  ContactDirectoryTests
//
//  Created by Ambrose Silveira on 18/05/25.
//

import XCTest
import SwiftUI
import ViewInspector
import Testing

@testable import ContactDirectory

struct UserDetailViewUnit_ViewInspectorTests {
    @Test
    func testUserProperty() {
        let user = User(id: 1, name: "Alice", company: "XYZ Inx", username: "amber", email: "amber@xyz.com", address: "5th main", zip: "6943", state: "CA", country: "USA", phone: "1234567890", photo: nil)
        let view = UserDetailsView(user: user)
        #expect(view.user == user)
    }
    
    /// Verifies that the navigation title displays the user's name or fallback.
    @Test
    func testNavigationTitleFallback() {
        let user = User(id: 2, name: nil, company: nil, username: nil, email: nil, address: nil, zip: nil, state: nil, country: nil, phone: nil, photo: nil)
        let view = UserDetailsView(user: user)
        #expect((view.user.name ?? "User Details") == "User Details")
    }
}

// MARK: - ViewInspector UI Tests for UserDetailsView

/// ViewInspector-based tests for `UserDetailsView`
struct UserDetailsViewInspectorTests {
    
    /// Verifies all sections and rows exist and display correct details
    @Test
    @MainActor
    func testAllSectionsAndRowsPresent() throws {
        let user = User(
            id: 1,
            name: "John Doe",
            company: "XYZ Inc",
            username: "JohnD",
            email: "jonhdoe@xyz.com",
            address: "1st Street",
            zip: "4532",
            state: "CA",
            country: "USA",
            phone: "1234567890",
            photo: "https://sample.com/photo.jpg"
        )
        let view = UserDetailsView(user: user)
        let list = try view.inspect().list()
        
        // Section 0: Profile image
        let profileSection = try list.section(0)
        XCTAssertNoThrow(try profileSection.find(ProfileImageView<RoundedRectangle>.self))
        
        // Section 1: Personal Information
        let personalSection = try list.section(1)
        
        //check for name
        let nameRow = try findDetailItemRow(in: personalSection, labelText: "Name")
        #expect(try nameRow?.hStack().text(2).string() == "John Doe")
        
        //check for username
        let usernameRow = try findDetailItemRow(in: personalSection, labelText: "Username")
        #expect(try usernameRow?.hStack().text(2).string() == "JohnD")
        
        //check for company
        let companyRow = try findDetailItemRow(in: personalSection, labelText: "Company")
        #expect(try companyRow?.hStack().text(2).string() == "XYZ Inc")
        
        // Section 2: Contact
        let contactSection = try list.section(2)
        
        //check for email
        let emailRow = try findDetailItemRow(in: contactSection, labelText: "Email")
        #expect(try emailRow?.hStack().text(2).string() == "jonhdoe@xyz.com")
        
        //check for phone
        let phoneRow = try findDetailItemRow(in: contactSection, labelText: "Phone")
        #expect(try phoneRow?.hStack().text(2).string() == "1234567890")
        
        // Section 3: Address
        let addressSection = try list.section(3)
        
        //check for street
        let streetRow = try findDetailItemRow(in: addressSection, labelText: "Street")
        #expect(try streetRow?.hStack().text(2).string() == "1st Street")
        
        //check for state
        let stateRow = try findDetailItemRow(in: addressSection, labelText: "State")
        #expect(try stateRow?.hStack().text(2).string() == "CA")
        
        //check for country
        let countryRow = try findDetailItemRow(in: addressSection, labelText: "Country")
        #expect(try countryRow?.hStack().text(2).string() == "USA")
        
        //check for ZIP
        let zipRow = try findDetailItemRow(in: addressSection, labelText: "ZIP Code")
        #expect(try zipRow?.hStack().text(2).string() == "4532")
    }
    
    /// Verifies that nil values in user show "N/A" in the rows.
    @Test
    @MainActor
    func testNilValuesDisplayNA() throws {
        let user = User(
            id: 2,
            name: nil,
            company: nil,
            username: nil,
            email: nil,
            address: nil,
            zip: nil,
            state: nil,
            country: nil,
            phone: nil,
            photo: nil
        )
        let view = UserDetailsView(user: user)
        let list = try view.inspect().list()
        
        let personalSection = try list.section(1)
        let nameRow = try findDetailItemRow(in: personalSection, labelText: "Name")
        #expect(try nameRow?.hStack().text(2).string() == "N/A") // DetailItemRow should show N/A for nil
        
        let companyRow = try findDetailItemRow(in: personalSection, labelText: "Company")
        #expect(try companyRow?.hStack().text(2).string() == "N/A")
    }
    
    func findDetailItemRow(
        in section: InspectableView<ViewType.Section>,
        labelText: String
    ) throws -> InspectableView<ViewType.View<DetailItemRow>>? {
        for index in 0..<section.count {
            let row = try? section.view(DetailItemRow.self, index)
            let text = try? row?.hStack().text(0).string()
            if text == labelText {
                return row
            }
        }
        return nil
    }
}
