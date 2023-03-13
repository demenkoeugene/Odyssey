//
//  Model.swift
//  Odyssey
//
//  Created by Eugene Demenko on 12.03.2023.
//

import Foundation

struct Currency: Decodable {
    var currencyCodeA: Int
    var currencyCodeB: Int
    var date: Int
    var rateSell: Float
    var rateBuy: Float
    var rateCross: Float
    
    var formattedDate: String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yy HH:mm:ss"
            let formattedDate = dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(date)))
            return formattedDate
    }

}










    
