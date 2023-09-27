//
//  AdditionalRouter.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 25/09/23.
//

import Foundation
import UIKit

class AdditionalRouter: AdditionalPresenterToRouter{
    func navigateToListOfGenreScreen(from view: AdditionalPresenterToView) {
        guard let view = view as? UIViewController else { return }
        let genres = ScreenConfigurator.shared.createListOfGenreScreen(viewAdditionalScreen: view)
        
        view.navigationController?.pushViewController(genres, animated: true)
    }
    
}
