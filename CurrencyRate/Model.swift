//
//  Model.swift
//  CurrencyRate
//
//  Created by yongseok lee on 2022/07/27.
//

import Foundation

struct Currency {
    var currencyName: String
    var currencyRate: Double
    var koreanWon: Double
    var foreignCurrency: Double
    
    var exchangeWonToDoller: Double {
        get {
           return koreanWon / currencyRate
        }
        set {
            koreanWon = newValue
        }
    }
//    var result : String {
//        
//    }
}
