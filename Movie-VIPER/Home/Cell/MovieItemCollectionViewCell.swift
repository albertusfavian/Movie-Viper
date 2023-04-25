//
//  MovieItemCollectionViewCell.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 18/04/23.
//

import UIKit
import Kingfisher

class MovieItemCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var viewContainer: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureView()
        
        // Initialization code
    }
    
    func binding(movieData: Movie){
        movieTitle.text = movieData.title
        movieOverview.text = movieData.overview
        let url = (URL(string: "\(Constant.baseImgURL)\(movieData.posterPath)"))
        self.movieImage.kf.setImage(with: url)
    }
    
    func configureView(){
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = CGRect(x: 0, y: viewContainer.frame.minY, width: viewContainer.frame.size.width, height: viewContainer.frame.size.height)
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      
        self.layer.cornerRadius = 10
        movieImage.layer.cornerRadius = 5
        movieImage.addSubview(blurEffectView)
    }

}
