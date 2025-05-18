//
//  ProfileImageUnit_ViewInspectorTest.swift
//  ContactDirectoryTests
//
//  Created by Ambrose Silveira on 19/05/25.
//

import SwiftUI
import ViewInspector
import Testing

@testable import ContactDirectory

//MARK: Unit Test

struct ProfileImageViewTests {
    
    @Test
    func testImageURLProperty() {
        let view = ProfileImageView<Circle>(
            photoURL: "https://exampleURL.com/photo.jpg",
            size: 40,
            clipShape: Circle()
        )
        #expect(view.photoURL == "https://exampleURL.com/photo.jpg")
        #expect(view.size == 40)
    }
}

//MARK: View inspector Test

struct ProfileImageViewInspectorTests {
    
    @Test
    func testDisplaysPlaceholderWhenNoImageAvailable() throws {
        let view = ProfileImageView<Circle>(
            photoURL: nil,
            size: 80,
            clipShape: Circle()
        )
        let image = try view.inspect().find(ViewType.Image.self)
        let systemName = try image.actualImage().name()
        #expect(systemName == "person.circle.fill")
    }

    @Test
    func testDisplaysAsyncImageWhenURLExists() throws {
        let view = ProfileImageView<Circle>(
            photoURL: "https://exampleURL.com/photo.jpg",
            size: 80,
            clipShape: Circle()
        )
        // AsyncImage is present in the view hierarchy
        let _ = try view.inspect().find(ViewType.AsyncImage.self)
    }
}
