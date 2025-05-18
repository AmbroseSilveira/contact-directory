//
//  DetailItemRowUITests.swift
//  ContactDirectoryUITests
//
//  Created by Ambrose Silveira on 18/05/25.
//

import XCTest

final class DetailItemRowUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        // perform cleanup
    }
    
    func testDetailRowUIDisplayCorrectly() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        //accessibility IDs
        let keyLabel = app.staticTexts["detailLabel"]
        
        //accessibility IDs
        let valueLabel = app.staticTexts["detailValue"]
        
        XCTAssertTrue(keyLabel.exists)
        XCTAssertTrue(valueLabel.exists)
                XCTAssertEqual(keyLabel.label, "Email:")
        XCTAssertEqual(keyLabel.label, "sample@example.com")
    }
}
