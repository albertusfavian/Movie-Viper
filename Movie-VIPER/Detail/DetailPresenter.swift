//
//  DetailPresenter.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 21/04/23.
//

import Foundation
import RxSwift

class DetailPresenter: DetailViewToPresenter{

    var view: DetailPresenterToView?
    var interactor: DetailPresenterToInteractor?
    var router: DetailPresenterToRouter?
    var movie: Movie?
    var reviews: [Review]?
    var videos: Videos?
    
    let disposeBag = DisposeBag()
    
    init(movie: Movie){
        self.movie = movie
    }
    
    func viewDidLoad() {
        if let movie = movie {
            interactor?.getReviews(movieId: String(movie.id))
        }
        getVideo()
    }
    
    func getVideo(){
        if let movieId = movie?.id{
            interactor?.getVideo(movieId: String(movieId))
        }
    }
    
    
}

extension DetailPresenter: DetailInteractorToPresenter{
    func didSuccessGetVideo(videos: Videos) {
        self.videos = videos
        view?.updateVideo(video: videos)
    }
    
    func didFailedGetVideo(response: String) {
        print("")
    }
    
    func didSuccessGetReview(reviews: [Review]) {
        self.reviews = reviews
        view?.updateTable()
    }
    
    func didFailed(response: String) {
        print("")
    }
    
    
}
