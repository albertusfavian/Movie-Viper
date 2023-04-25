//
//  Genre.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 17/04/23.
//

import Foundation

struct Genres: Codable {
    var genres: [Genre]?
}
struct Genre: Codable {
    var id: Int?
    var name: String?
}
