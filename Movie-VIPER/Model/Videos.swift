//
//  Videos.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 26/04/23.
//

import Foundation

// MARK: - Videos
public struct Videos: Codable {
    public let id: Int
    public let results: [Video]

    public init(id: Int, results: [Video]) {
        self.id = id
        self.results = results
    }
}

// MARK: - Result
public struct Video: Codable {
    public let iso639_1: ISO639_1
    public let iso3166_1: ISO3166_1
    public let name, key: String
    public let site: Site
    public let size: Int
    public let official: Bool
    public let publishedAt, id: String

    enum CodingKeys: String, CodingKey {
        case iso639_1 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case name, key, site, size, official
        case publishedAt = "published_at"
        case id
    }

    public init(iso639_1: ISO639_1, iso3166_1: ISO3166_1, name: String, key: String, site: Site, size: Int, official: Bool, publishedAt: String, id: String) {
        self.iso639_1 = iso639_1
        self.iso3166_1 = iso3166_1
        self.name = name
        self.key = key
        self.site = site
        self.size = size
        self.official = official
        self.publishedAt = publishedAt
        self.id = id
    }
}

public enum ISO3166_1: String, Codable {
    case us = "US"
}

public enum ISO639_1: String, Codable {
    case en = "en"
}

public enum Site: String, Codable {
    case youTube = "YouTube"
}

public enum TypeEnum: String, Codable {
    case clip = "Clip"
    case featurette = "Featurette"
    case teaser = "Teaser"
    case trailer = "Trailer"
}
