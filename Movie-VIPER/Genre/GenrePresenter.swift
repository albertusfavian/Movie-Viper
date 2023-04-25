//
//  GenrePresenter.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 18/04/23.
//

import Foundation

class GenrePresenter: GenreViewToPresenter {
    
    var view: GenrePresenterToView?
    var interactor: GenrePresenterToInteractor?
    var router: GenrePresenterToRouter?
    var listOfMovie: [Movie]?
    var genreId: String
    
    init(genreId: String){
        self.genreId = genreId
    }
    
    func viewDidLoad() {
        interactor?.getMovieByGenre(genreId: genreId ?? "")
    }
    
    func didSelectMovieAt(movie: Movie) {
        router?.navigateToDetailMovie(from: self.view!, movie: movie)
    }
}

extension GenrePresenter: GenreInteractorToPresenter{
    func didSuccessGetMovie(response: [Movie]) {
        self.listOfMovie = response
        view?.updateCollection()
    }
    
    func didFailed(response: String) {
        print("")
    }
    
    
}
