//
//  HomeProtocol.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 17/04/23.
//

import Foundation

protocol HomeViewToPresenter: AnyObject{
    var view: HomePresenterToView? {get set}
    var interactor: HomePresenterToInteractor? {get set}
    var router: HomePresenterToRouter? {get set}
    var listOfMovies: [Movie] {get set}
    var listOfGenre: [Genre] {get set}
    func viewDidLoad()
    func didSelectedMovieAt(movie: Movie)
    func didSelectGenreAt(genreId: Int?)
    
}

protocol HomePresenterToView: AnyObject{
    var presenter: HomeViewToPresenter? {get set}
    func updateTable()
    func updateCollection()
}

protocol HomePresenterToInteractor: AnyObject{
    var presenter: HomeInteractorToPresenter? {get set}
    func getGenres()
    func getMovieListDiscover()
}

protocol HomeInteractorToPresenter: AnyObject {
    func didSuccessGetGenre(response: [Genre])
    func didFailedGetGenre(error: String)
    func didSuccessGetMovieListDiscover(response: [Movie])
    func didFailedGetMovieListDiscover(error: String)
}

protocol HomePresenterToRouter: AnyObject{
    func navigateToListMovieByGenre(from: HomePresenterToView, genreId: Int)
    func navigateToDetailMovie(from: HomePresenterToView, movie: Movie)
}


