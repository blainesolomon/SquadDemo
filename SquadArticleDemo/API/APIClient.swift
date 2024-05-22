//
//  APIClient.swift
//  SquadArticleDemo
//
//  Created by Blaine on 5/22/24.
//

import Foundation

@MainActor
@Observable class APIClient {
    static func fetchInitialArticles() async throws -> [Article] {
        return Article.sampleArticles
    }

    static func fetchLatestArticle() async throws -> Article {
        let title = generateMockArticleTitle()
        return Article(title: title, date: .now, id: UUID())
    }
}

extension APIClient {
    static func generateMockArticleTitle() -> String {
        let adjectives = ["Amazing", "Innovative", "Incredible", "Revolutionary", "Essential", "Ultimate", "Comprehensive", "Groundbreaking", "Unbelievable", "Effortless"]
        let topics = ["Guide", "Tips", "Tricks", "Secrets", "Strategies", "Techniques", "Ideas", "Ways", "Methods", "Facts"]
        let subjects = ["Technology", "Health", "Fitness", "Business", "Marketing", "Cooking", "Travel", "Education", "Finance", "Lifestyle"]

        let randomAdjective = adjectives.randomElement()!
        let randomTopic = topics.randomElement()!
        let randomSubject = subjects.randomElement()!

        let title = "\(randomAdjective) \(randomTopic) for \(randomSubject)"
        return title
    }
}
