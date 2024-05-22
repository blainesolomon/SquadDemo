//
//  ContentView.swift
//  SquadArticleDemo
//
//  Created by Blaine on 5/22/24.
//

import SwiftUI

struct ContentView: View {
    @State private var articles = [Article]()
    @State private var isShowingLoadingError = false

    var body: some View {
        NavigationStack {

            ArticleCollectionView(articles: articles)

            // Fetch inital articles
                .task {
                    // Mock delay to represent network delay
                    try? await Task.sleep(for: .seconds(2))
                    await fetchInitialArticles()
                }

            // Pull to refresh
                .refreshable {
                    // Mock delay to represent network delay
                    try? await Task.sleep(for: .seconds(1))
                    await fetchLatestArticle()
                }

            // Button to test loading error UI
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            isShowingLoadingError = true
                        } label: {
                            Image(systemName: "ladybug.circle")
                        }
                    }
                }
        }

        // Mock alert to represent a load error with retry support
        .alert("Simulating Error Message", isPresented: $isShowingLoadingError) {
            Button("Retry") {
                Task {
                    await fetchLatestArticle()
                }
            }

            Button("Cancel", role: .cancel) {

            }
        } message: {
            Text("Unable to load")
        }
    }


}

// Fetching Articles

extension ContentView {
    func fetchInitialArticles() async {
        do {
            articles = try await APIClient.fetchInitialArticles()
        } catch {
            isShowingLoadingError = true
        }
    }

    func fetchLatestArticle() async {
        do {
            let article = try await APIClient.fetchLatestArticle()
            withAnimation {
                articles.insert(article, at: 0)
            }

        } catch {
            isShowingLoadingError = true
        }
    }
}

#Preview {
    ContentView()
}
