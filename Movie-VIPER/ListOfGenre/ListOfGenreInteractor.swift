//
//  ListOfGenreInteractor.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 25/09/23.
//

import Foundation

class ListOfGenreInteractor: ListOfGenrePresenterToInteractor{
    
    var presenter: ListOfGenreInteractorToPresenter?
    
    var worker: MovieWorkerProtocol?
    
    init (with worker:MovieWorkerProtocol = MovieWorker()) {
        self.worker = worker
        self.worker?.genreTabDelegate = self
    }
    
    func getGenre() {
        worker?.getGenreTabSection()
    }
    
}

extension ListOfGenreInteractor: MovieGenreProtocol{
    func didSuccessGetGenres(response: [Genre]) {
        presenter?.didSuccessGetGenre(response: response)
    }
    
    func didFailedGetGenres(error: String) {
        print ("")
    }
}
