//
//  AdditionalPresenter.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 25/09/23.
//

import Foundation

class AdditionalPresenter: AdditionalViewToPresenter, AdditionalInteractorToPresenter{
    var view: AdditionalPresenterToView?
    var interactor: AdditionalPresenterToInteractor?
    var router: AdditionalPresenterToRouter?
    
    func didButtonTapped() {
        router?.navigateToListOfGenreScreen(from: self.view!, onDismiss: handleOnDismiss(selectedGenre:))
    }
    
    
    func updateLabel(with genre: String) {
        view?.updateViewLabel(genreLabel: genre)
    }
    
    func handleOnDismiss(selectedGenre: String?) {
        view?.updateViewLabel(genreLabel: selectedGenre ?? "")
        
    }
}
