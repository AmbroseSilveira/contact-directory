//
//  ProfileImageViewUITest.swift
//  ContactDirectoryUITests
//
//  Created by Ambrose Silveira on 19/05/25.
//

import XCTest

final class ProfileImageViewUITest: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testProfileImageViewDisplays() throws {
        let profileImage = app.images["DetailsProfileImage"]
        let imageExists = profileImage.waitForExistence(timeout: 5)
        XCTAssertTrue(imageExists, "Profile iamge should appear having proper identifier")
    }
}
