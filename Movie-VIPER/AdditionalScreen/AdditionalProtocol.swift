//
//  AdditionalProtocol.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 25/09/23.
//

import Foundation

protocol AdditionalViewToPresenter: AnyObject {
    var view: AdditionalPresenterToView? { get set }
    var interactor: AdditionalPresenterToInteractor? { get set }
    var router: AdditionalPresenterToRouter? { get set }
    func didButtonTapped()
    func updateLabel(with genre: String)
}

protocol AdditionalPresenterToView: AnyObject {
    var presenter: AdditionalViewToPresenter? { get set }
    func updateViewLabel(genreLabel: String)
}

protocol AdditionalPresenterToInteractor: AnyObject {
    var presenter: AdditionalInteractorToPresenter? { get set }
}

protocol AdditionalInteractorToPresenter: AnyObject{
    
}

protocol AdditionalPresenterToRouter: AnyObject{
    func navigateToListOfGenreScreen(from: AdditionalPresenterToView, onDismiss: ((_ selectedGenre: String?) -> Void)?)
}
