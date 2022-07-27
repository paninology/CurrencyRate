//
//  Model.swift
//  CurrencyRate
//
//  Created by yongseok lee on 2022/07/27.
//

import Foundation

struct Currency {
    var currencyRate: Double
    var koreanWon: Double
    var USDoller: Double
    
    var exchangeWonToDoller: Double {
        get {
           return koreanWon / currencyRate
        }
        set {
            koreanWon = newValue
        }
    }
}
