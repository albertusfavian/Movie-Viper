//
//  DetailPresenter.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 21/04/23.
//

import Foundation

class DetailPresenter: DetailViewToPresenter{
    var view: DetailPresenterToView?
    var interactor: DetailPresenterToInteractor?
    var router: DetailPresenterToRouter?
    var movie: Movie?
    var reviews: [Review]?
    
    init(movie: Movie){
        self.movie = movie
    }
    
    func viewDidLoad() {
        if let movie = movie {
            interactor?.getReviews(movieId: String(movie.id))
        }
    }
    
    
}

extension DetailPresenter: DetailInteractorToPresenter{
    func didSuccessGetReview(reviews: [Review]) {
        self.reviews = reviews
        view?.updateTable()
    }
    
    func didFailed(response: String) {
        print("")
    }
    
    
}
