//
//  UserListView.swift
//  ContactDirectory
//
//  Created by Ambrose Silveira on 17/05/25.
//

import SwiftUI

//TODO: Add document comments
struct UserListView: View {
    // @State var userViewModel: UserListViewModel // state only changes back and forth
    @Bindable var userViewModel: UserListViewModel
    @State private var searchText: String = ""
    var onSelect: (User) -> Void
    
    //to get the results of the filter from serach bar
    var filteredUsers: [User] {
        if searchText.isEmpty {
            return userViewModel.users
        } else {
            return userViewModel.users.filter { user in
                (user.name ?? "").localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            Group {
                if let _ = userViewModel.error {
                    VStack(spacing: 16) {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(.orange)
                            .font(.system(size: 48.0))
                        Text("Oops!, We could not load your data.")
                            .font(.headline)
                        Text("Please retry after some time.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Button(action: {
                            Task {
                                await userViewModel.getUserProfiles()
                            }
                        }) {
                            Text("Retry")
                                .bold()
                                .padding()
                                .frame(width: 200, height: 50) // seting before background sets for button  else for area
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8.0)
                        }
                    }
                    // Text("Error:  \(error.localizedDescription)")
                    //     .foregroundColor(.red)
                } else if userViewModel.users.isEmpty {
                    ProgressView("Loading...")
                } else {
                    List(filteredUsers) { user in
                        Button(action: { onSelect(user) }) {
                            HStack {
                                if let photo = user.photo, let url = URL(string: photo) {
                                    AsyncImage(url: url) { userImage in
                                        if let image = userImage.image {
                                            image
                                                .resizable()
                                        } else if userImage.error != nil {
                                            Image(systemName:"person.circle.fill")
                                                .resizable()
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    .frame(width: 40.0, height: 40.0)
                                    .clipShape(Circle())
                                }
                                VStack(alignment: .leading) {
                                    Text(user.name ?? "")
                                        .font(.headline)
                                    if let email = user.email {
                                        Text(email)
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                }
                            }
                        }
                    }
                    .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic))
                    .refreshable(action: {
                        await userViewModel.getUserProfiles()
                    })
                }
            }
            .navigationTitle("Users")
        }
        .task {
            await userViewModel.getUserProfiles()
        }
    }
}

