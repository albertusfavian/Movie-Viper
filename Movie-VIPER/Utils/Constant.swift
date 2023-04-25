//
//  Constant.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 17/04/23.
//

import Foundation
import UIKit

class Constant{
    static let apiKey = "930fe530d711d2b1367b8acb0dacc7f1"
    static let baseImgURL = "https://image.tmdb.org/t/p/w342/"
    
    static var screenWidth: CGFloat {
        get {
            if UIDevice.current.orientation.isLandscape {
                return max(UIScreen.main.bounds.size.height, UIScreen.main.bounds.size.width)
            } else {
                return min(UIScreen.main.bounds.size.height, UIScreen.main.bounds.size.width)
            }
        }
    }
}
