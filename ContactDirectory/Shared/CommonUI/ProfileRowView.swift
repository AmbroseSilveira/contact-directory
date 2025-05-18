//
//  ProfileRowView.swift
//  ContactDirectory
//
//  Created by Ambrose Silveira on 18/05/25.
//

import SwiftUI

///A reusable view that displays users'  profile image, name and email in a row. Use this view to present profile information in list or detail screen.
///
///Example appearance:
///```
/// ___________________
///| Image      Name   |
///|           Email   |
/// -------------------
///```
struct ProfileRowView: View {
    
    //MARK: Properties
    
    ///Contains the data of the user, to display the user information. e.x: user.name, user.email, etc.
    let user: User
    
    //MARK: Body
    
    var body: some View {
        HStack {
            ProfileImageView(photoURL: user.photo, size: 40.0, clipShape: Circle())
            VStack(alignment: .leading) {
                Text(user.name ?? "")
                    .font(.headline)
                    .accessibilityIdentifier("profileNameLabel")
                if let email = user.email {
                    Text(email)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .accessibilityIdentifier("profileEmailLabel")
                }
            }
        }
    }
}
