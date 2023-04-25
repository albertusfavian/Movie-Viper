//
//  Converter.swift
//  Movie-VIPER
//
//  Created by Albert Mandiri on 25/04/23.
//

import Foundation

func convertStringToDate(inputDate: String) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    let oldDate = dateFormatter.date(from: inputDate)
    
    let convertDateFormat = DateFormatter()
    convertDateFormat.dateFormat = "dd MMMM yyyy"
    
    return convertDateFormat.string(from: oldDate!)
}
