//
//  CurrencyCalculations.swift
//  SH-Currency
//
//  Created by Kevin Thrailkill on 2/16/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import UIKit

class CurrencyCalculations: NSObject {
    
    
    /// Function that calculates the currency exchange amount from calc view
    ///
    /// - Parameters:
    ///   - baseCur: base currency amount from input
    ///   - selectedCur: selected currency from dictionary
    /// - Returns: return calculated currency amount to display on calc view
    class func getCurrencyAmount(baseCur: NSNumber, selectedCur: NSNumber) -> NSNumber {
        
        return baseCur.doubleValue * selectedCur.doubleValue as NSNumber
        
    }
    

}
