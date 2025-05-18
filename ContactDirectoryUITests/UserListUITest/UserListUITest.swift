//
//  UserListUITest.swift
//  ContactDirectoryUITests
//
//  Created by Ambrose Silveira on 18/05/25.
//

import XCTest

final class UserListUITest: XCTestCase {
    
    let app = XCUIApplication()
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func testUserListAppearsAndCanSearch() {
        // Wait for the list to appear (add accessibilityIdentifier in ProfileRowView for real test)
        let userCell = app.buttons["Jane"]
        XCTAssertTrue(userCell.waitForExistence(timeout: 5))
        
        // Search for "Bob"
        let searchField = app.searchFields.firstMatch
        searchField.tap()
        searchField.typeText("Berry")
        XCTAssertTrue(app.buttons["Berry"].exists)
    }
    
    func testErrorViewAppearsOnError() {
        // Simulate error state in your UI test launch or by special test mode
        let errorText = app.staticTexts["We could not load your data."]
        XCTAssertTrue(errorText.waitForExistence(timeout: 5))
    }
}
