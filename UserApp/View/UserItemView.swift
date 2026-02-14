//
//  UserItemView.swift
//  UserApp
//
//  Created by Purushottam Padhya on 14/2/2026.
//

import SwiftUI

struct UserItemView: View {
    let user: User
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(user.name)
                .font(.headline)
            Text(user.email)
                .font(.subheadline)
            Text(user.company.name)
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 6)
    }
}

#Preview {
    UserItemView(user: MockData.sampleUser)
}
