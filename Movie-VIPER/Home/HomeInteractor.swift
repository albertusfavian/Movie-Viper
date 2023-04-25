//
//  HomeInteractor.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 17/04/23.
//

import Foundation

class HomeInteractor{
    var presenter: HomeInteractorToPresenter?
    var worker: MovieWorkerProtocol?
    
    init(with worker: MovieWorkerProtocol = MovieWorker()) {
        self.worker = worker
        self.worker?.genreDelegate = self
        self.worker?.movieListDiscover = self
    }
    
}

extension HomeInteractor: HomePresenterToInteractor{
    func getMovieListDiscover() {
        worker?.getMovieListDiscover()
    }
    
    func getGenres() {
        worker?.getGenre()
    }
    
    
}

extension HomeInteractor: MovieGenreProtocol, MovieListDiscover{
    func didSuccessGetGenres(response: [Genre]) {
        presenter?.didSuccessGetGenre(response: response)
    }
    
    func didFailedGetGenres(error: String) {
        print ("")
    }
    
    func didSuccessGetMovieListDiscover(response: [Movie]) {
        presenter?.didSuccessGetMovieListDiscover(response: response)
    }
    
    func didFailedGetMovieListDiscover(error: String) {
        print("")
    }
}
