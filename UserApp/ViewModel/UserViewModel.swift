// UsersViewModel.swift

import Foundation
import Combine

enum UsersState: Equatable {
    case idle
    case loading
    case loaded([User])
    case failed(String)
}

@Observable
@MainActor
class UsersViewModel {
    // This will automatically observable with the @Observable macro no need to @Published
    private(set) var state: UsersState = .idle
    private let apiClient: UserAPIClientProtocol

    init(apiClient: UserAPIClientProtocol) {
        self.apiClient = apiClient
    }

    func load() async {
        // setting state loading to show loading view everytime when API gets request
        state = .loading
        print("Requesting users...")

        do {
            //TODO: -  Will remove
            // simulate network delay of 1 second to show progress view
            try await Task.sleep(nanoseconds: 1_000_000_000)

            let users = try await apiClient.fetchUsers()
            print("User fetched successfully")
            state = .loaded(users)
        } catch {
            print("Error on fetching users")
            state = .failed(error.localizedDescription)
        }
    }
}
