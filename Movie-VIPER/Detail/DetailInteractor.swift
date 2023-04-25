//
//  DetailInteractor.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 21/04/23.
//

import Foundation

class DetailInteractor: DetailPresenterToInteractor{
    var presenter: DetailInteractorToPresenter?
    var worker: MovieWorkerProtocol?
    
    init (with worker: MovieWorkerProtocol = MovieWorker()){
        self.worker = worker
        self.worker?.movieDelegate = self
    }
    
    func getReviews(movieId: String) {
        worker?.getReviews(movieId: movieId)
    }
}

extension DetailInteractor: MovieDetailProtocol{
    func didSuccessGetReview(response: Reviews) {
        presenter?.didSuccessGetReview(reviews: response.results ?? [])
    }
    
    func didFailedGetReview(error: String) {
        print("")
    }
    
    
}
