//
//  UserApp.swift
//  UserApp
//

import SwiftUI

@main
struct UserApp: App {
    var body: some Scene {
        WindowGroup {
            // Dependency Injection To UsersListView
            let apiClient = APIClient()
            let usersAPIClient = UsersAPIClient(apiClient: apiClient)
            let viewModel = UsersViewModel(apiClient: usersAPIClient)
            
            UsersListView(viewModel: viewModel)
        }
    }
}
