//
//  ArticleCollectionView.swift
//  SquadArticleDemo
//
//  Created by Blaine on 5/22/24.
//

import SwiftUI

struct ArticleCollectionView: View {
    let articles: [Article]

    var body: some View {
        List {

            // Grouping articles into a section with a footer
            Section {
                ForEach(articles) { article in
                    ArticleRowView(article: article)
                }
            } footer: {
                if !articles.isEmpty {
                    Text("Pull to refresh new articles")
                }
            }
        }


        // Showing title after articles load
        .navigationTitle(articles.isEmpty ? "" : "Articles")

        // Empty state support
        .overlay {
            if articles.isEmpty {
                ContentUnavailableView {
                    Label("No Articles", systemImage: "newspaper.fill")
                } description: {
                    Text("New articles will appear here.")
                }
            }
        }

    }
}

#Preview {
    NavigationStack {
        // Preview with and without articles

        //ArticleCollectionView(articles: [])
        ArticleCollectionView(articles: Article.sampleArticles)

    }
}
