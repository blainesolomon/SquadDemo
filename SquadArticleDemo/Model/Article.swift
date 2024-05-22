//
//  Article.swift
//  SquadArticleDemo
//
//  Created by Blaine on 5/22/24.
//

import Foundation

struct Article: Identifiable, Equatable {
    let title: String
    let date: Date
    let id: UUID
}

extension Article {
    static let sampleArticles = [
        Article(title: "WWDC24", date: .now, id: UUID()),
        Article(title: "iOS Development", date: .now, id: UUID()),
        Article(title: "SwiftUI Essentials", date: .now, id: UUID())
    ]
}
