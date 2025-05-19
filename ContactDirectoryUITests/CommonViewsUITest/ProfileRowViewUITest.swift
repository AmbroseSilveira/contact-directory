//
//  ProfileRowViewUITest.swift
//  ContactDirectoryUITests
//
//  Created by Ambrose Silveira on 19/05/25.
//

import XCTest

final class ProfileRowViewUITest: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testProfileRowDisplayUserNameAndEmail() throws {
        let nameLabel = app.staticTexts["profileNameLabel"]
        let emailLabel = app.staticTexts["profileEmailLabel"]
        
        XCTAssertTrue(nameLabel.waitForExistence(timeout: 2))
        XCTAssertTrue(emailLabel.exists)
    }
}
