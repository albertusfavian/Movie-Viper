//
//  ReviewTableViewCell.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 24/04/23.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewTitle: UILabel!
    @IBOutlet weak var reviewDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func onBind(review: Review){
        reviewTitle.text = review.author
        reviewDescription.text = review.content
    }
}
