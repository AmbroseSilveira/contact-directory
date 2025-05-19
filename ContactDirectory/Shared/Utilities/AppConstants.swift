//
//  AppConstants.swift
//  ContactDirectory
//
//  Created by Ambrose Silveira on 19/05/25.
//

import Foundation


//MARK: Static strings in app

/**
 Enum defining all app constants strings. This file manages all the static strings used throughout the application
 */
enum AppConstants {
    
    //MARK: Error messages
    
    ///Enum containing all string messages related to Errors in the app
    enum ErrorMessages {
        static let dataLoadingError = "We could not load your data."
        static let errorString = "Faker Attribute Error: person.astName is not supported"
        static let retryMessage = "Please retry after some time."
        static let oopsMessage = "Oops!"
        static let notAvailableMessage = "N/A"
    }
    
    //MARK: User messages
    
    ///Enum containing all strings messages to be shown to the users during an operation
    enum UserMessages {
        static let loadingMessage = "Loading users..."
    }
    
    //MARK: UI Display messages
    
    /// Enum containing all static strings which appear on the UI e.g: Username, name, section headers etc
    enum UIMessages {
        
        //MARK: Navigation IDs
        
        static let userListNavigationTitle = "Users"
        static let userDetailsNavigationTitle = "User Details"
        
        //MARK: User Details View IDs
        
        static let personalSectionHeaderID = "Personal Information"
        static let contactSectionHeaderID = "Contact"
        static let addressSectionHeaderID = "Address"
        
        //MARK: User attributes IDs
        
        static let name = "Name"
        static let userName = "Username"
        static let company = "Company"
        static let email = "Email"
        static let phone = "Phone"
        static let street = "Street"
        static let state = "State"
        static let country = "Country"
        static let zipCode = "ZIP Code"
        
        //MARK: UIElements text
        
        static let retryButtonText = "Retry"
    }
    
    //MARK: System defined keys
    
    ///Defines system - keys used for icons, images, etc.
    enum SystemKeys {
        static let exclamationMarkIconName = "exclamationmark.triangle.fill"
        static let profileIconName = "person.circle.fill"
    }
}

//MARK: Accessibility Identifiers

///Constant strings for accesbility Identifers for UI Elements for testing
enum AccessibilityIdentifiers {
    
    ///Defines accessbility identifiers for `UserDetailsView` screen
    enum UserDetailsIDs {
        static let profileImageSectionID = "ProfileImageSection"
        static let personalInfoSectionID = "PersonalInfoSection"
        static let contactSectionID = "ContactSection"
        static let addressSectionID = "AddressSection"
        static let userDetailsListID = "UserDetailsViewList"
    }
    
    ///Defines accessbility identifiers for `ErrorView` screen
    enum ErrorViewIDs {
        static let errorIconID = "ErrorIcon"
        static let errorMessageID = "ErrorMessage"
        static let retryPromptID = "RetryPrompt"
        static let retryButtonID = "RetryButton"
    }
    
    ///Defines accessbility identifiers for `DetailItemRow` view
    enum DetailItemRowIDs {
        static let detailLabelID = "detailLabel"
        static let detailValueID = "detailValue"
    }
    
    ///Defines accessbility identifiers for `ProfileImageView` view
    enum ProfileImageViewIDs {
        static let profileImageID =  "DetailsProfileImage"
    }
    
    ///Defines accessbility identifiers for `ProfileRowView` view
    enum ProfileRowViewIDs {
        static let profileNameID = "profileNameLabel"
        static let profileEmailID = "profileEmailLabel"
    }
}
