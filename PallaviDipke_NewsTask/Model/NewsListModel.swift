//
//  NewsListModel.swift
//  PallaviDipke_NewsTask
//
//  Created by Admin on 4/7/21.
//

import Foundation

// MARK: - NewListModel
struct NewListModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source
    let author, title, description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case description
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}


struct Comments: Codable {
    let comments: Int
}

struct Likes: Codable {
    let likes: Int
}
