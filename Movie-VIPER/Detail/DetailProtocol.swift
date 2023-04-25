//
//  DetailProtocol.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 21/04/23.
//

import Foundation

protocol DetailViewToPresenter: AnyObject{
    var view: DetailPresenterToView? {get set}
    var interactor: DetailPresenterToInteractor? {get set}
    var router: DetailPresenterToRouter? {get set}
    var movie: Movie? {get set}
    var reviews: [Review]? {get set}
    func viewDidLoad()
    
}

protocol DetailPresenterToView: AnyObject{
    var presenter: DetailViewToPresenter? {get set}
    func updateTable()
}

protocol DetailPresenterToInteractor: AnyObject{
    var presenter: DetailInteractorToPresenter? {get set}
    var worker: MovieWorkerProtocol? {get set}
    func getReviews(movieId: String) 
}

protocol DetailInteractorToPresenter: AnyObject{
    func didSuccessGetReview(reviews: [Review])
    func didFailed(response: String)
}

protocol DetailPresenterToRouter: AnyObject{
    
}
