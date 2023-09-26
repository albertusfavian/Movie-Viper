//
//  ListOfGenrePresenter.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 25/09/23.
//

import Foundation

class ListOfGenrePresenter: ListOfGenreViewToPresenter {
    
    var view: ListOfGenrePresenterToView?
    var interactor: ListOfGenrePresenterToInteractor?
    var router: ListOfGenrePresenterToRouter?
    var listOfGenre: [Genre] = []
    
    func viewDidLoad() {
        interactor?.getGenre()
    }
    
    func didSelectGenreAt(genreLabel: String) {
        router?.navigateBack(from: self.view!, selectedGenreName: genreLabel)
        
        
    }
}

extension ListOfGenrePresenter: ListOfGenreInteractorToPresenter{
    func didSuccessGetGenre(response: [Genre]) {
        self.listOfGenre = response
        view?.updateTable()
    }
    
    func didFailedGetGenre(error: String) {
        print("")
    }
}
