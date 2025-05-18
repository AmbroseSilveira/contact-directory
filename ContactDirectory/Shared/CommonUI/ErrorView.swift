//
//  ErrorView.swift
//  ContactDirectory
//
//  Created by Ambrose Silveira on 18/05/25.
//

import SwiftUI

/**
 A reusable view to show an error message with a retry action. Use this view to intimate users about erorrs in the cases of failures or unexpected events and provides an option to retry.
 
 - Properties:
 - message:  Custom error message to be displayed on the screen.
 - retryAction: Closure to perform custom operations or retry on tap of the retry button
 */
struct ErrorView: View {
    
    //MARK: Properties
    
    ///Holds custom message to be displayed on the screen to the user.
    let message: String
    
    ///Closure to perform custom logic when the retry button is tapped.
    let retryAction: () -> Void
    
    ///Retry prompt message on the screen.
    let retryMessage: String? = "Please retry after some time."
    
    //MARK: Body
    
    var body: some View {
        VStack(spacing: 16.0) {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundColor(.orange)
                .font(.system(size: 48.0))
                .accessibilityIdentifier("ErrorIcon")
            Text("Oops!, \(message)")
                .font(.headline)
                .accessibilityIdentifier("ErrorMessage")
            Text(retryMessage!)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .accessibilityIdentifier("RetryPrompt")
            Button(action: retryAction) {
                Text("Retry")
                    .bold()
                    .padding()
                    .frame(width: 200.0, height: 50.0)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8.0)
            }
            .accessibilityIdentifier("RetryButton")
        }
    }
}
