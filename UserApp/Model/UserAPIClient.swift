// UsersAPIClient.swift

import Foundation

//MARK: - UserAPI client protocol to fetch users 
protocol UserAPIClientProtocol {
    func fetchUsers() async throws -> [User]
}

struct UsersAPIClient: UserAPIClientProtocol {
    
    private let apiClient : APIClientProtocol
    
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchUsers() async throws -> [User] {
        
        try await apiClient.request(UsersEndpoint.getUsers)
    }
}

