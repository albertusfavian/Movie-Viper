//
//  GenreViewModel.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 17/04/23.
//

import Foundation

struct GenreViewModel {
    var genreId: Int?
    var genreName: String?
    
    init(from response: Genre) {
        self.genreId = response.id
        self.genreName = response.name
    }
}
