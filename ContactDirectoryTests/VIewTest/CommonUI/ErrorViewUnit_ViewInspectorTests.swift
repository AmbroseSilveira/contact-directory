//
//  ErrorViewUnit_ViewInspectorTests.swift
//  ContactDirectoryTests
//
//  Created by Ambrose Silveira on 18/05/25.
//

import Testing
import ViewInspector
import SwiftUI

@testable import ContactDirectory

//MARK: Unit test for ErrorView

/// Unit test suite for `ErrorView` view.
struct ErrorViewUnitTests {
    
    ///Verification test for message property
    @Test
    func testMessageProperty() {
        let errorView = ErrorView(message: "Test error", retryAction: {})
        #expect(errorView.message == "Test error")
    }
    
    ///Verification for the retryClosure call
    @Test
    func testRetryActionCalled() {
        var closureCalled = false
        let errorView = ErrorView(message: "Error", retryAction: { closureCalled = true })
        errorView.retryAction()
        #expect(closureCalled)
    }
    
    /// Verifies that the retryMessage property is set to the default.
    @Test
    func testRetryMessageDefault() {
        let errorView = ErrorView(message: "Error", retryAction: {})
        #expect(errorView.retryMessage == "Please retry after some time.")
    }
}

//MARK: View inspector UI test

///Tests suite for `ErrorView` based on ViewInspector, ensuring proper rendering of UI elements
struct ErrorViewInspectorTests {
    
    ///Verifies the view displays the proper and valid error and retry prompt
    @Test
    @MainActor
    func testRetryActionAndDisplayError() throws {
        
        let errorView = ErrorView(message: "Network error", retryAction:{})
        let vStack = try errorView.inspect().vStack()
        
        //Check icon
        let icon = try vStack.image(0)
        #expect(try icon.actualImage().name() == "exclamationmark.triangle.fill")
        
        // Check error message
        let errorText = try vStack.text(1).string()
        #expect(errorText == "Oops!, We could not load your data. ")
        
        //Check for retry button label
        let retryText = try vStack.text(2).string()
        #expect(retryText == "Please retry after some time.")
        
        //check for retry action
        let retryButtonLabel = try vStack.button(3).labelView().text().string()
        #expect(retryButtonLabel == "Retry")
    }
    
    ///Verifies the retry button action
    @Test
    @MainActor
    func testRetryButtonAction() throws {
        var buttonTapped = false
        let errorView = ErrorView(message: "Anymessage", retryAction: { buttonTapped = true })
        let vStack = try errorView.inspect().vStack()
        try vStack.button(3).tap()
        #expect(buttonTapped)
    }
    
}
