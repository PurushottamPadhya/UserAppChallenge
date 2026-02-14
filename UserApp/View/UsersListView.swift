// UsersListView.swift

import SwiftUI

struct UsersListView: View {
    @Bindable private var viewModel : UsersViewModel
    
    init(viewModel: UsersViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Users")
                .toolbar {
                    Button("Refresh") {
                        Task {
                            await viewModel.load()
                        }
                    }
                }
                .task {
                    await viewModel.load()
                }
        }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .idle, .loading:
            LoadingView(loadingMessage: "Loading users...")

        case .failed(let message):
            ErrorView(message: "Something went wrong: \(message)", retryTitle: "Retry") {
                Task {
                    await viewModel.load()
                }
            }
        case .loaded(let users):
            List(users) { user in
                UserItemView(user: user)
            }
        }
    }
}
