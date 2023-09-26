//
//  ScreenConfigurator.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 17/04/23.
//

import Foundation
import UIKit

class ScreenConfigurator{
    public static let shared = ScreenConfigurator()
    
    func createHomeScreen() -> UIViewController {
        let view: UIViewController & HomePresenterToView = HomeViewController()
        let presenter: HomeViewToPresenter & HomeInteractorToPresenter = HomePresenter()
        let interactor: HomePresenterToInteractor = HomeInteractor()
        let router: HomePresenterToRouter = HomeRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    func createMovieListByGenre(genreId: Int) -> UIViewController {
        let view: UIViewController & GenrePresenterToView = GenreViewController()
        let presenter: GenreViewToPresenter & GenreInteractorToPresenter = GenrePresenter(genreId: String(genreId))
        let interactor: GenrePresenterToInteractor = GenreInteractor()
        let router: GenrePresenterToRouter = GenreRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
        
    }
    
    func createMovieDetailScreen(movie: Movie) -> UIViewController {
        let view: UIViewController & DetailPresenterToView = DetailViewController()
        let presenter: DetailViewToPresenter & DetailInteractorToPresenter = DetailPresenter(movie: movie)
        let interactor: DetailPresenterToInteractor = DetailInteractor()
        let router: DetailPresenterToRouter = DetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    func createListOfGenreScreen(_ onDismiss: ((_ selectedGenreName: String?) -> Void)?) -> UIViewController {
        let view: UIViewController & ListOfGenrePresenterToView = ListOfGenreView()
        let presenter: ListOfGenreViewToPresenter & ListOfGenreInteractorToPresenter = ListOfGenrePresenter()
        let interactor: ListOfGenrePresenterToInteractor = ListOfGenreInteractor()
        let router: ListOfGenrePresenterToRouter = ListOfGenreRouter() 
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.onDismissWithData = onDismiss
        
        return view
    }
    
    func createAdditionalScreen() -> UIViewController {
        let view: UIViewController & AdditionalPresenterToView = AdditionalScreenView()
        let presenter: AdditionalViewToPresenter & AdditionalInteractorToPresenter = AdditionalPresenter()
        let interactor: AdditionalPresenterToInteractor = AdditionalInteractor()
        let router: AdditionalPresenterToRouter = AdditionalRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
