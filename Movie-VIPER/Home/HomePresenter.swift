//
//  HomePresenter.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 17/04/23.
//

import Foundation

class HomePresenter: HomeViewToPresenter{
    var listOfGenre: [Genre] = []
    var listOfMovies: [Movie] = []
    var view: HomePresenterToView?
    var interactor: HomePresenterToInteractor?
    var router: HomePresenterToRouter?
    
    func viewDidLoad() {
        interactor?.getGenres()
        interactor?.getMovieListDiscover()
    }
    
    func didSelectGenreAt(genreId: Int?) {
        router?.navigateToListMovieByGenre(from: self.view!, genreId: genreId ?? 0)
    }
    
    func didSelectedMovieAt(movie: Movie) {
        router?.navigateToDetailMovie(from: self.view!, movie: movie)
    }
}

extension HomePresenter: HomeInteractorToPresenter{
    func didSuccessGetMovieListDiscover(response: [Movie]) {
        self.listOfMovies = response
        view?.updateCollection()
    }
    
    func didFailedGetMovieListDiscover(error: String) {
        print("")
    }
    
    func didSuccessGetGenre(response: [Genre]) {
        self.listOfGenre = response
        view?.updateTable()
    }
    
    func didFailedGetGenre(error: String) {
        print("")
    }
    
    
}
