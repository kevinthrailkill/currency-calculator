//
//  CurrencyCalculations.swift
//  SH-Currency
//
//  Created by Kevin Thrailkill on 2/16/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import UIKit

class CurrencyCalculations: NSObject {
    
    
    private var selectedCurrency: Rate?
    private var baseCurrency: Rate?
    
    
    init(selectedCur : Rate, baseCur: Rate){
        self.selectedCurrency = selectedCur
        self.baseCurrency = baseCur
    }
    
    func getCurrencyAmount(baseCur: NSNumber) -> NSNumber {
        
        return baseCur.doubleValue * self.selectedCurrency!.getCurrencyRate().doubleValue as NSNumber
        
    }
    
    func getBaseCurrency() -> Rate {
        return self.baseCurrency!
    }
    
    func getSelectedCurrency() -> Rate {
        return self.selectedCurrency!
    }

    

//    /// Function that calculates the currency exchange amount from calc view
//    ///
//    /// - Parameters:
//    ///   - baseCur: base currency amount from input
//    ///   - selectedCur: selected currency from dictionary
//    /// - Returns: return calculated currency amount to display on calc view
//    class func getCurrencyAmount(baseCur: NSNumber, selectedCur: NSNumber) -> NSNumber {
//        
//        return baseCur.doubleValue * selectedCur.doubleValue as NSNumber
//        
//    }
    

}
