//
//  DetailRowItemViewInspectorTests.swift
//  ContactDirectoryTests
//
//  Created by Ambrose Silveira on 18/05/25.
//

import Testing
import ViewInspector
import SwiftUI

@testable import ContactDirectory

//extension DetailItemRow {}

/**
 Unit tests for the `DetailItemRow`  view.
 Test suite verifies the proper initialization and data handling
 of the `DetailItemRow` struct. Checks for nil and valid cases.
 */
struct DetailItemRowTest {
    
    ///Verifies that the label and value are set as expected.
    @Test func testLabelAndValuesSetup() async throws {
        let detailRow = DetailItemRow(label: "Email:", value: "sample@example.com")
        await #expect(detailRow.label == "Email:")
        await #expect(detailRow.value == "sample@example.com")
    }
    
    ///Verifies that the value property is nil when initiialised as nil and is valid
    @Test("testForNilValue")
    func testNilValueTest() {
        let detailRow = DetailItemRow(label: "Company:", value: nil)
        #expect(detailRow.value == nil)
        #expect(detailRow.label == "Company:")
    }
}

/**
 This unit tests suite is based on ViewInspector for  `DetailItemRow`.
 Verifies proper display of text for both labels for the view with assigned and nil values
 */
struct DetailRowItemViewInspectorTests {
    
    /// Verifies view shows proper labels, values and accesses the view hierarchy using the view inspector. Assertion to match the values
    @Test
    @MainActor
    func testDisplayLabelAndValue() throws {
        let view = DetailItemRow(label: "Email:", value: "sample@example.com")
        let hStack = try view.inspect().hStack()
        let labelText = try hStack.text(0).string()
        let valueText = try hStack.text(2).string()
        
        #expect(labelText == "Email:")
        #expect(valueText == "sample@example.com")
    }
    
    /// Verifies view shows proper labels, nil value for the valueLabel. Displays and asserts `N/A`
    @Test
    @MainActor
    func testDisplaysNAForNilValue() throws {
        let view = DetailItemRow(label: "Phone", value: nil)
        let hStack = try view.inspect().hStack()
        let valueText = try hStack.text(2).string()
        #expect(valueText == "N/A")
    }
}

