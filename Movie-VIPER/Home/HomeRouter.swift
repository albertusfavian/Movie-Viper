//
//  HomeRouter.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 17/04/23.
//

import Foundation
import UIKit

class HomeRouter: HomePresenterToRouter{
    func navigateToListMovieByGenre(from view: HomePresenterToView, genreId: Int) {
        guard let view = view as? UIViewController else { return }
        let movieList = ScreenConfigurator.shared.createMovieListByGenre(genreId: genreId)
        view.navigationController?.pushViewController(movieList, animated: true)
    }
    
    func navigateToDetailMovie(from view: HomePresenterToView, movie: Movie) {
        guard let view = view as? UIViewController else { return }
        let movieDetail = ScreenConfigurator.shared.createMovieDetailScreen(movie: movie)
        view.navigationController?.pushViewController(movieDetail, animated: true)
    }
    
}
