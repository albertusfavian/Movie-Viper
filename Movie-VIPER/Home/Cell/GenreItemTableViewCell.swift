//
//  GenreItemTableViewCell.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 17/04/23.
//

import UIKit

class GenreItemTableViewCell: UITableViewCell {

    
    @IBOutlet weak var genreItem: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
