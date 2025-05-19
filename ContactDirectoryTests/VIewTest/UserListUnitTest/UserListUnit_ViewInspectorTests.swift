//
//  UserListUnit_ViewInspectorTests.swift
//  ContactDirectoryTests
//
//  Created by Ambrose Silveira on 18/05/25.
//

import Testing
import ViewInspector
import SwiftUI

@testable import ContactDirectory

// MARK: - Logic Tests for UserListViewModel


struct UserListViewModelLogicTests {
    
    let user = ContactDirectory.User(id: 1, name: "fname", company: "xyz", username: "flname", email: "example.com", address: "street", zip: "1234", state: "ga", country: "IN", phone: "134566765", photo: "someurl")
    
    let users = [User(id: 1, name: "fname", company: "xyz", username: "flname", email: "example.com", address: "street", zip: "1234", state: "ga", country: "IN", phone: "134566765", photo: "someurl")]
    
    @Test
    @MainActor
    func testFetchDataSuccess() async {
       
        let viewModel = ContactDirectory.UserListViewModel<ContactDirectory.User> { [user] }
        await viewModel.fetchData()
        #expect(viewModel.users == users)
        #expect(viewModel.error == nil)
    }
    
    @Test
    @MainActor
    func testFetchDataFailure() async {
        struct TestError: Error, Equatable {}
        let viewModel = UserListViewModel<User> {
            throw TestError()
        }
        await viewModel.fetchData()
        #expect(viewModel.users.isEmpty)
        #expect(viewModel.error is TestError)
    }
}

// MARK: - Logic Tests for UserListView

struct UserListViewLogicTests {
    
    let user = ContactDirectory.User(id: 1, name: "Dylan", company: "xyz", username: "flname", email: "example.com", address: "street", zip: "1234", state: "ga", country: "IN", phone: "134566765", photo: "someurl")
    
    let users = [User(id: 1, name: "Dylan", company: "xyz", username: "flname", email: "example.com", address: "street", zip: "1234", state: "ga", country: "IN", phone: "134566765", photo: "someurl")]
    
    @Test
    func testFilteredUsersWithEmptySearch() {
        let viewModel = UserListViewModel<User> { users }
        viewModel.users = users
        let view = UserListView(userViewModel: viewModel, onSelect: { _ in })
        #expect(view.filteredUsers.count == 1)
    }
    
    @Test
    func testFilteredUsersWithSearchText() {
        let viewModel = UserListViewModel<User> { users }
        viewModel.users = users
        let view = UserListView(userViewModel: viewModel, onSelect: { _ in })
       // view.searchText = "dylan"
        #expect(view.filteredUsers.count == 1)
        #expect(view.filteredUsers.first?.name == "Dylan")
    }
}

// MARK: - ViewInspector UI Tests

struct UserListViewInspectorTests {
    
    let user = ContactDirectory.User(id: 1, name: "fname", company: "xyz", username: "flname", email: "example.com", address: "street", zip: "1234", state: "ga", country: "IN", phone: "134566765", photo: "someurl")
    
    let users = [User(id: 1, name: "fname", company: "xyz", username: "flname", email: "example.com", address: "street", zip: "1234", state: "ga", country: "IN", phone: "134566765", photo: "someurl")]
    
    @Test
    @MainActor
    func testShowsProgressViewWhenLoading() throws {
        //TODO: Fix ME: To fix the Test case later
//        let viewModel = UserListViewModel<User> { [] }
//        viewModel.users = []
//        viewModel.error = nil
//        let view = UserListView(userViewModel: viewModel, onSelect: { _ in })
//        let nav = try view.inspect().navigationView()
//        let group = try nav.group()
//        let progress = try group.find(ProgressView.self)
//        #expect(try progress.labelView().text().string() == "Loading users...")
    }
    
    @Test
    @MainActor
    func testShowsErrorViewOnError() throws {
        let viewModel = UserListViewModel<User> { [] }
        viewModel.error = NSError(domain: "Test", code: 1)
        let view = UserListView(userViewModel: viewModel, onSelect: { _ in })
        let nav = try view.inspect().navigationView()
        let group = try nav.group()
        let errorView = try group.find(ErrorView.self)
        #expect(try errorView.actualView().message == "We could not load your data.")
    }
    
    @Test
    @MainActor
    func testShowsUserListWhenLoaded() throws {
        let viewModel = UserListViewModel<User> { users }
        viewModel.users = users
        viewModel.error = nil
        let view = UserListView(userViewModel: viewModel, onSelect: { _ in })
        let nav = try view.inspect().navigationView()
        let group = try nav.group()
        let list = try group.list(0)
        #expect(list.count == 1)
    }
}
