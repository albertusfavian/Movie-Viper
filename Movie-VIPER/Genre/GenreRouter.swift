//
//  GenreRouter.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 18/04/23.
//

import Foundation
import UIKit

class GenreRouter: GenrePresenterToRouter{
    func navigateToDetailMovie(from view: GenrePresenterToView, movie: Movie) {
        guard let view = view as? UIViewController else { return }
        let movie = ScreenConfigurator.shared.createMovieDetailScreen(movie: movie)
        view.navigationController?.pushViewController(movie, animated: true)
    }
    
    
}
