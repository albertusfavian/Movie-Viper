//
//  Reviews.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 21/04/23.
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let reviews = try? JSONDecoder().decode(Reviews.self, from: jsonData)

import Foundation

// MARK: - Reviews
public struct Reviews: Codable {
    public let id, page: Int
    public let results: [Review]
    public let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case id, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }

    public init(id: Int, page: Int, results: [Review], totalPages: Int, totalResults: Int) {
        self.id = id
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}

// MARK: - Result
public struct Review: Codable {
    public let author: String
    public let authorDetails: AuthorDetails
    public let content, createdAt, id, updatedAt: String
    public let url: String

    enum CodingKeys: String, CodingKey {
        case author
        case authorDetails = "author_details"
        case content
        case createdAt = "created_at"
        case id
        case updatedAt = "updated_at"
        case url
    }

    public init(author: String, authorDetails: AuthorDetails, content: String, createdAt: String, id: String, updatedAt: String, url: String) {
        self.author = author
        self.authorDetails = authorDetails
        self.content = content
        self.createdAt = createdAt
        self.id = id
        self.updatedAt = updatedAt
        self.url = url
    }
}

// MARK: - AuthorDetails
public struct AuthorDetails: Codable {
    public let name, username: String
    public let avatarPath: String?
    public let rating: Int?

    enum CodingKeys: String, CodingKey {
        case name, username
        case avatarPath = "avatar_path"
        case rating
    }

    public init(name: String, username: String, avatarPath: String?, rating: Int?) {
        self.name = name
        self.username = username
        self.avatarPath = avatarPath
        self.rating = rating
    }
}
