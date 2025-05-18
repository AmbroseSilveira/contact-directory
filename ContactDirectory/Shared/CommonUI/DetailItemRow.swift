//
//  DetailItemRow.swift
//  ContactDirectory
//
//  Created by Ambrose Silveira on 18/05/25.
//

import Foundation
import SwiftUI

///Custom reusable view that displays information in a key value pair format in a horizontal row.
///
///Example appearance:
///```
/// ____________________
///| Key:          Value|
/// --------------------
///```
///- Properties:
///- label: The title of key associated with the data to display on the left of the view
///- value: The value associate with the key, displayed on the right. if the value is `nil`, displays `N/A`
struct DetailItemRow: View {
    
    //MARK: Properties
    
    ///Holds the key to display on left
    let label: String
    
    ///The value to display against the key. If `nil`, displays `N/A`
    let value: String?
    
    //MARK: Body
    
    var body: some View {
        HStack {
            Text(label)
                .accessibilityIdentifier("detailLabel")
            Spacer()
            Text(value ?? "N/A")
                .foregroundColor(.secondary)
                .multilineTextAlignment(.trailing)
                .accessibilityIdentifier("detailValue")
        }
    }
}
