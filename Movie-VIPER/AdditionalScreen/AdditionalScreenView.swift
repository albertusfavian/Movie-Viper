//
//  AdditionalScreenView.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 25/09/23.
//

import UIKit

class AdditionalScreenView: UIViewController, AdditionalPresenterToView {
    var presenter: AdditionalViewToPresenter?
    
    @IBOutlet weak var navigateToGenres: UIButton!
    @IBOutlet weak var genreLabel: UILabel!
    var listOfGenre = ListOfGenreView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ini ProtocolDelegate")

        // Do any additional setup after loading the view.
    }
    
    func updateViewLabel(genreLabel: String) {
        self.genreLabel.text = genreLabel
    }
    
    @IBAction func navigateToGenres(_ sender: Any) {
        presenter?.didButtonTapped()
    }

}

extension AdditionalScreenView: PassBackData {
    func updateLabel(genreLabel: String) {
        self.genreLabel.text = genreLabel
        
    }
}
