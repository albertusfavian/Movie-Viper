//
//  ListOfGenreProtocol.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 25/09/23.
//

import Foundation

protocol ListOfGenreViewToPresenter: AnyObject {
    var view: ListOfGenrePresenterToView? { get set }
    var interactor: ListOfGenrePresenterToInteractor? { get set }
    var router: ListOfGenrePresenterToRouter? { get set }
    func didSelectGenreAt(genreLabel: String)
    func viewDidLoad()
    var listOfGenre: [Genre] { get set }
}

protocol ListOfGenrePresenterToView: AnyObject {
    var presenter: ListOfGenreViewToPresenter? { get set }
    func updateTable()
    
}

protocol ListOfGenrePresenterToInteractor: AnyObject {
    var presenter: ListOfGenreInteractorToPresenter? { get set }
    func getGenre()
}

protocol ListOfGenreInteractorToPresenter: AnyObject {
    func didSuccessGetGenre(response: [Genre])
    func didFailedGetGenre(error: String)
}

protocol ListOfGenrePresenterToRouter: AnyObject {
    var onDismissWithData: ((_ selectedGenre: String?) -> Void)? { get set }
    
    func navigateBack(from view: ListOfGenrePresenterToView,
                      selectedGenreName: String)
}
