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
    
    
    /// Calculates the currency exchange rate
    ///
    /// - Parameter baseCur: base currency amount
    /// - Returns: exchange amount
    func getCurrencyAmount(baseCur: NSNumber) -> NSNumber {
        
        return baseCur.doubleValue * self.selectedCurrency!.getCurrencyRate().doubleValue as NSNumber
    }
    
    func getBaseCurrency() -> Rate {
        return self.baseCurrency!
    }
    
    func getSelectedCurrency() -> Rate {
        return self.selectedCurrency!
    }


}
