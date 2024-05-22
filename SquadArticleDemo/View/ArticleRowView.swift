//
//  ArticleRowView.swift
//  SquadArticleDemo
//
//  Created by Blaine on 5/22/24.
//

import SwiftUI

struct ArticleRowView: View {
    let article: Article

    var body: some View {

        // Showing article title and date
        VStack(alignment: .leading) {
            Text(article.title)
                .font(.headline)

            Text(article.date, style: .date)
                .font(.subheadline)

        }
    }
}

#Preview {
    List {
        ArticleRowView(article: Article(title: "Bird Set Free", date: .now, id: UUID()))
    }
}
