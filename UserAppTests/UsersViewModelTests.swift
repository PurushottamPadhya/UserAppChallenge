//
//  Untitled.swift
//  QantasCodeChallenge
//
//  Created by Micah Napier on 12/12/2025.
//

import Testing
@testable import UserApp

@MainActor
struct UsersViewModelTests {
    
    @Test func userLoadSuccess() async throws {
        let userMock = UsersAPIClientMock()
        let viewModel = UsersViewModel(apiClient: userMock)
        
        #expect(viewModel.state == .idle)
        await viewModel.load()
        
        switch viewModel.state {
        case .loaded(let users):
            #expect(users == MockData.sampleUsers)
        default:
            Issue.record("Expected loaded state successfully")
        }
        
    }
    
    @Test func userLoadFailure() async throws {
        let userMock = UsersAPIClientMock(shouldFail: true)
        let viewModel = UsersViewModel(apiClient: userMock)
        
        await viewModel.load()
        
        switch viewModel.state {
        case .failed(let message):
            #expect(message.isEmpty == false)
        default:
            Issue.record("Expected user API failed")
        }
    }
    
    @Test func userLoadSuccessWithEmptyUsers() async throws {
        let userMock = UsersAPIClientMock(users: [])
        let viewModel = UsersViewModel(apiClient: userMock)
        
        #expect(viewModel.state == .idle)
        await viewModel.load()
        
        switch viewModel.state {
        case .loaded(let users):
            #expect(users.isEmpty)
        default:
            Issue.record("Expected loaded state successfully with Empty users")
        }
        
    }
}
