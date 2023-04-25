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
}
