//
//  MockAPIClient.swift
//  UserApp
//
//  Created by Purushottam Padhya on 14/2/2026.
//

@testable import UserApp

struct UsersAPIClientMock: UserAPIClientProtocol {
    var users: [User] = MockData.sampleUsers
    var shouldFail: Bool = false

    func fetchUsers() async throws -> [User] {
        if shouldFail {
            throw ApiError.invalidURL
        }
        return users
    }
}
