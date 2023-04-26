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
    
    func getVideo(movieId: String){
        worker?.getVideo(movieId: movieId)
    }
}

extension DetailInteractor: MovieDetailProtocol{
    func didSuccessGetVideo(response: Videos) {
        presenter?.didSuccessGetVideo(videos: response)
    }
    
    func didFailedGetVideo(error: String) {
        presenter?.didFailedGetVideo(response: "")
    }
    
    func didSuccessGetReview(response: Reviews) {
        presenter?.didSuccessGetReview(reviews: response.results )
    }
    
    func didFailedGetReview(error: String) {
        print("")
    }
    
    
}
