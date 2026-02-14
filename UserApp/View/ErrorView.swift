//
//  ErrorView.swift
//  UserApp
//
//  Created by Purushottam Padhya on 14/2/2026.
//

import SwiftUI

struct ErrorView: View {
    let message: String
    let retryTitle: String? // optional retry title
    let retryAction: (()-> Void)? // optional retry action
    
    var body: some View {
        VStack (spacing: 8) {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .foregroundColor(.red)
            
            Text(message)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
                .padding(.horizontal)
            
            if let retryTitle, let retryAction {
                Button(retryTitle,
                       action: retryAction)
                .buttonStyle(.borderedProminent)
                .tint(.blue)
            }
            
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(UIColor.secondarySystemBackground))
        )
        .padding()
        
    }
}

#Preview {
    ErrorView(message: "Something went wrong", retryTitle: nil, retryAction: nil)
}
