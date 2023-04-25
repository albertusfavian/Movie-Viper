//
//  GenreProtocol.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 18/04/23.
//

import Foundation

protocol GenreViewToPresenter: AnyObject{
    var view: GenrePresenterToView? {get set}
    var interactor: GenrePresenterToInteractor? {get set}
    var router: GenrePresenterToRouter? {get set}
    var listOfMovie: [Movie]? {get set}
    var genreId: String {get set}
    func viewDidLoad()
    func didSelectMovieAt(movie: Movie)
}

protocol GenrePresenterToView: AnyObject {
    var presenter: GenreViewToPresenter? {get set}
    func updateCollection()
}

protocol GenrePresenterToInteractor: AnyObject{
    var presenter: GenreInteractorToPresenter? {get set}
    var worker: MovieWorkerProtocol? {get set}
    func getMovieByGenre(genreId: String)
}

protocol GenreInteractorToPresenter: AnyObject {
    func didSuccessGetMovie(response: [Movie])
    func didFailed(response: String)
}

protocol GenrePresenterToRouter: AnyObject {
    func navigateToDetailMovie(from: GenrePresenterToView, movie: Movie)
}
