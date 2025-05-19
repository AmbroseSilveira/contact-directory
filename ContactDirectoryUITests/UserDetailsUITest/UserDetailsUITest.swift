//
//  UserDetailsUITest.swift
//  ContactDirectoryUITests
//
//  Created by Ambrose Silveira on 18/05/25.
//

import XCTest

final class UserDetailsUITest: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func testUserDetailsViewUIElements() throws {
       
        
        // Check for profile image
        let profileImage = app.images["DetailsProfileImage"]
        XCTAssertTrue(profileImage.exists, "Profile image should be visible")
        
        // Check for personal info section
        XCTAssertTrue(app.staticTexts["PersonalInfoSection"].exists)
        XCTAssertTrue(app.staticTexts["Name"].exists)
        XCTAssertTrue(app.staticTexts["Username"].exists)
        XCTAssertTrue(app.staticTexts["Company"].exists)
        
        // Check for contact section
        XCTAssertTrue(app.staticTexts["ContactSection"].exists)
        XCTAssertTrue(app.staticTexts["Contact"].exists)
        XCTAssertTrue(app.staticTexts["Email"].exists)
        XCTAssertTrue(app.staticTexts["Phone"].exists)
        
        // Check for address section
        XCTAssertTrue(app.staticTexts["AddressSection"].exists)
        XCTAssertTrue(app.staticTexts["Address"].exists)
        XCTAssertTrue(app.staticTexts["Street"].exists)
        XCTAssertTrue(app.staticTexts["State"].exists)
        XCTAssertTrue(app.staticTexts["Country"].exists)
        XCTAssertTrue(app.staticTexts["ZIP Code"].exists)
         
    }
}
