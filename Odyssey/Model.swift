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
 
    var currencyNameA: String {
        if let key = processDictionary().first(where: { $0.value as! Int == currencyCodeA})?.key {
            return key
        }
        return ""
    }

    var currencyNameB: String {
        if let key = processDictionary().first(where: { $0.value as! Int == currencyCodeB})?.key {
            return key
        }
        return ""
    }

    func processDictionary() -> [String: Any] {
        if let dict = NSDictionary(contentsOfFile: "СurrencyCodes.plist") as? [String: Any] {
            var currenciesDictionary = [String: Any]()
            for (key, value) in dict {
                currenciesDictionary[key] = value
            }
            
            currenciesDictionary["newKey"] = "newValue"
            
            return currenciesDictionary // Add a return statement
        }
        return [:] // Add a default return statement
    }


}










    
