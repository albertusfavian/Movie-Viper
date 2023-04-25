//
//  GenreInteractor.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 18/04/23.
//

import Foundation

class GenreInteractor: GenrePresenterToInteractor{
    
    var worker: MovieWorkerProtocol?
    var presenter: GenreInteractorToPresenter?
    
    init(with worker: MovieWorkerProtocol = MovieWorker()) {
        self.worker = worker
        self.worker?.movieListDiscover = self
    }
    
    func getMovieByGenre(genreId: String) {
        worker?.getMovieByGenre(genreId: genreId)
    }
}

extension GenreInteractor: MovieListDiscover{
    func didSuccessGetMovieListDiscover(response: [Movie]) {
        presenter?.didSuccessGetMovie(response: response)
    }
    
    func didFailedGetMovieListDiscover(error: String) {
        print("")
    }
    
    
}
