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
    
    func navigateBack(from view: ListOfGenrePresenterToView, selectedGenreName: String) {
        if let vc = view as? UIViewController? {
            vc?.navigationController?.popViewController(animated: true)
            if let onDismiss = onDismissWithData {
                onDismiss(selectedGenreName)
            }
        }
    }
    
}
