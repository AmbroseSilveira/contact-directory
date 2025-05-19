//
//  ProfileImageView.swift
//  ContactDirectory
//
//  Created by Ambrose Silveira on 18/05/25.
//

import SwiftUI

/**
 A reusable view that downlaods and displays  an image from an URL with customizable size and shape.  If the image fails to load, default system image of person icon is displayed as a fallback.
 
 - Properties:
 - photoURL:  `URL` to download the image of type `String`.
 - size: `width` and `height` of type `CGFloat` for the image.
 - clipShape: The shape to clip the image appearance,  of type `Shape`. ex: Circle, Rounded rectangle, etc.
 */
struct ProfileImageView<S: Shape>: View {
    
    //MARK: Properties
    
    /// Holds the image URL as a String.
    let photoURL: String?
    
    /// The width and height for the image used as square.
    let size: CGFloat
    
    /// Shape to clip the image.
    let clipShape: S
    
    //MARK: Body
    
    var body: some View {
        if let photo = photoURL, let url = URL(string: photo) {
            AsyncImage(url: url) { imagePhase in
                if let image = imagePhase.image {
                    image.resizable()
                } else if imagePhase.error != nil {
                    Image(systemName: AppConstants.SystemKeys.profileIconName)
                        .resizable()
                        .foregroundColor(.gray)
                } else {
                    ProgressView()
                }
            }
            .frame(width: size, height: size)
            .clipShape(clipShape)
            .accessibilityIdentifier(AccessibilityIdentifiers.ProfileImageViewIDs.profileImageID)
        } else {
            Image(systemName: AppConstants.SystemKeys.profileIconName)
                .resizable()
                .foregroundColor(.gray)
                .frame(width: size, height: size)
                .clipShape(clipShape)
        }
    }
}
