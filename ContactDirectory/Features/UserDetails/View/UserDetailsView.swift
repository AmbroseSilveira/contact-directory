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
        .accessibilityIdentifier(AccessibilityIdentifiers.UserDetailsIDs.profileImageSectionID)
    }
    
    ///Section containing personal information: name, username, company
    private var personalInfoSection: some View {
        Section(AppConstants.UIMessages.personalSectionHeaderID) {
            DetailItemRow(label: AppConstants.UIMessages.name, value: user.name)
            DetailItemRow(label: AppConstants.UIMessages.userName, value: user.username)
            DetailItemRow(label: AppConstants.UIMessages.company, value: user.company)
        }
        .accessibilityIdentifier(AccessibilityIdentifiers.UserDetailsIDs.personalInfoSectionID)
    }
    
    ///Section containing contact deatils: email, phone
    private var contactSection: some View {
        Section(AppConstants.UIMessages.contactSectionHeaderID) {
            DetailItemRow(label: AppConstants.UIMessages.email, value: user.email)
            DetailItemRow(label: AppConstants.UIMessages.phone, value: user.phone)
        }
        .accessibilityIdentifier(AccessibilityIdentifiers.UserDetailsIDs.contactSectionID)
    }
    
    ///Section containing address information
    private var addressSection: some View {
        Section(AppConstants.UIMessages.addressSectionHeaderID) {
            DetailItemRow(label: AppConstants.UIMessages.street, value: user.address)
            DetailItemRow(label: AppConstants.UIMessages.state, value: user.state)
            DetailItemRow(label: AppConstants.UIMessages.country, value: user.country)
            DetailItemRow(label: AppConstants.UIMessages.zipCode, value: user.zip)
        }
        .accessibilityIdentifier(AccessibilityIdentifiers.UserDetailsIDs.addressSectionID)
    }
    
    //MARK: Body
    
    var body: some View {
        List {
            profileImageSection
            personalInfoSection
            contactSection
            addressSection
        }
        .navigationTitle(user.name ?? AppConstants.UIMessages.userDetailsNavigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        .accessibilityIdentifier(AccessibilityIdentifiers.UserDetailsIDs.userDetailsListID)
    }
}
