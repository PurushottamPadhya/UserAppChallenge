//
//  LoadingView.swift
//  UserApp
//
//  Created by Purushottam Padhya on 14/2/2026.
//

import SwiftUI

struct LoadingView: View {
    let loadingMessage: String
    var body: some View {
        VStack(spacing: 10) {
            ProgressView()
                .progressViewStyle(.circular)
            if !loadingMessage.isEmpty {
                Text(loadingMessage)
                    .font(.headline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
    }
}

#Preview {
    LoadingView(loadingMessage: "Loading")
}
