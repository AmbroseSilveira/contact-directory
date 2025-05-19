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
    
    ///Test that the row itesms are properly displayed in the screen
    func testDetailRowUIDisplayAsIntended() throws {
        let app = XCUIApplication()
        /*
         USe this in the main app launch to test with arguments
         if ProcessInfo.processInfo.arguments.contains("UITest_DetailItemRow") {
        //            DetailItemRow(label: "Email:", value: "sample@example.com")
        //        }
         */
       // app.launchArguments.append("UITest_DetailItemRow")
        app.launch()
        
        //accessibility IDs
        let keyLabel = app.staticTexts["detailLabel"]
        let valueLabel = app.staticTexts["detailValue"]
        
        XCTAssertTrue(keyLabel.waitForExistence(timeout: 5.0))
        XCTAssertTrue(valueLabel.exists)
        XCTAssertEqual(keyLabel.label, "Email:")
        XCTAssertEqual(valueLabel.label, "sample@example.com")
    }
}
