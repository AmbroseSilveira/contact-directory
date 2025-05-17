//
//  UserDetailsView.swift
//  ContactDirectory
//
//  Created by Ambrose Silveira on 17/05/25.
//

import SwiftUI

struct UserDetailsView: View {
    let user: User
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
    
    private var profileImageSection: some View {
        Section {
            if let photo = user.photo, let url = URL(string: photo) {
                AsyncImage(url: url) { userImage in
                    if let image = userImage.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 200.0)
                            .clipShape(RoundedRectangle(cornerRadius: 8.0))
                            .frame(maxWidth: .infinity)
                    } else if userImage.error != nil {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 200.0)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity)
                    } else {
                        ProgressView()
                    }
                }
                .padding(.vertical)
            }
        }
    }
    
    private var personalInfoSection: some View {
        Section("Personal Information") {
            DetailItemRow(label: "Name", value: user.name)
            DetailItemRow(label: "Username", value: user.username)
            DetailItemRow(label: "Company", value: user.company)
        }
    }
    
    private var contactSection: some View {
        Section("Contact") {
            DetailItemRow(label: "Email", value: user.email)
            DetailItemRow(label: "Phone", value: user.phone)
        }
    }
    
    private var addressSection: some View {
        Section("Address") {
            DetailItemRow(label: "Street", value: user.address)
            DetailItemRow(label: "State", value: user.state)
            DetailItemRow(label: "Country", value: user.country)
            DetailItemRow(label: "ZIP Code", value: user.zip)
        }
    }
}

struct DetailItemRow: View {
    let label: String
    let value: String?
    
    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Text(value ?? "N/A")
                .foregroundColor(.secondary)
                .multilineTextAlignment(.trailing)
        }
    }
}
