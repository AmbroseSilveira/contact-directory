//
//  ContactDirectoryUITests.swift
//  ContactDirectoryUITests
//
//  Created by Ambrose Silveira on 17/05/25.
//

import XCTest

final class ContactDirectoryUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false

    }


    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
