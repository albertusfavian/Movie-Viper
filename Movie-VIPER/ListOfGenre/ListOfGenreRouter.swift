//
//  ListOfGenreRouter.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 25/09/23.
//

import Foundation
import UIKit

class ListOfGenreRouter: ListOfGenrePresenterToRouter {
    
    var onDismissWithData: ((_ selectedGenre: String?) -> Void)?
    
    func navigateBack(from view: ListOfGenrePresenterToView) {
        if let vc = view as? UIViewController? {
            vc?.navigationController?.popViewController(animated: true)
        }
    }
    
}
