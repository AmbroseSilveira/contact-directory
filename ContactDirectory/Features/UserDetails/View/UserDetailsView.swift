//
//  UserDetailsView.swift
//  ContactDirectory
//
//  Created by Ambrose Silveira on 17/05/25.
//

import SwiftUI

/**
 A view that displays the detailed information about a user.  The information is grouped into the following sections:
 - Profile Image
 - Personal Informtion
 - Contact  Details
 - Address.
 */
struct UserDetailsView: View {
    
    //MARK: Properties
    
    ///The user data to display the information.
    let user: User
    
    /// Section for profile with image
    private var profileImageSection: some View {
        Section {
            ProfileImageView(photoURL: user.photo, size: 200.0, clipShape: RoundedRectangle(cornerRadius: 8.0))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical)
        }
    }
    
    ///Section containing personal information: name, username, company
    private var personalInfoSection: some View {
        Section("Personal Information") {
            DetailItemRow(label: "Name", value: user.name)
            DetailItemRow(label: "Username", value: user.username)
            DetailItemRow(label: "Company", value: user.company)
        }
    }
    
    ///Section containing contact deatils: email, phone
    private var contactSection: some View {
        Section("Contact") {
            DetailItemRow(label: "Email", value: user.email)
            DetailItemRow(label: "Phone", value: user.phone)
        }
    }
    
    ///Section containing address information
    private var addressSection: some View {
        Section("Address") {
            DetailItemRow(label: "Street", value: user.address)
            DetailItemRow(label: "State", value: user.state)
            DetailItemRow(label: "Country", value: user.country)
            DetailItemRow(label: "ZIP Code", value: user.zip)
        }
    }
    
    //MARK: Body
    
    var body: some View {
        List {
            profileImageSection
            personalInfoSection
            contactSection
            addressSection
        }
        .navigationTitle(user.name ?? "User Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
