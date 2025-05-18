//
//  ErrorViewUITests.swift
//  ContactDirectoryUITests
//
//  Created by Ambrose Silveira on 18/05/25.
//

import XCTest

final class ErrorViewUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testErrorViewUIElementsAndRetryButton() throws {
        // Check that the error icon exists
        let errorIcon = app.images["ErrorIcon"]
        XCTAssertTrue(errorIcon.exists, "Error icon should be visible")
        
        // Check that the error message is displayed
        let errorMessage = app.staticTexts["ErrorMessage"]
        XCTAssertTrue(errorMessage.exists, "Error message should be visible")
        
        // Check that the retry prompt is displayed
        let retryPrompt = app.staticTexts["RetryPrompt"]
        XCTAssertTrue(retryPrompt.exists, "Retry prompt should be visible")
        
        // Check that the retry button is displayed and tap it
        let retryButton = app.buttons["RetryButton"]
        XCTAssertTrue(retryButton.exists, "Retry button should be visible")
        retryButton.tap()
    }
}
