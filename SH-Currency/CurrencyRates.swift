//
//  CurrencyRates.swift
//  SH-Currency
//
//  Created by Kevin Thrailkill on 2/16/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//
//  Currency Rates class used to store the base currency and rates that you get back from the GET request

import UIKit
import SwiftyJSON


class CurrencyRates: NSObject {
    
    private var baseCurrency: Rate?
    private var currencyRatesArray: [Rate]?
    
    
    /// Parses the Swifty JSON and creates a new Currency Rate Object
    ///
    /// - Parameter result: json input from GET Call
    init(result: JSON){
        
        self.baseCurrency = Rate.init(cs: result["base"].rawString()!, cr: 1.0)
        self.currencyRatesArray = [Rate]()
        
        
        for item in result["rates"].dictionaryValue {
            
            let newRate = Rate.init(cs: item.key, cr: item.value.numberValue)
            self.currencyRatesArray?.append(newRate)
            
        }
    }
    
    
    // MARK: - Class getters
    
    func getBaseCurrency() -> Rate {
        return self.baseCurrency!
    }
    
    func getcurrencyRatesCount() -> Int {
        return self.currencyRatesArray!.count
       // return self.currencyRates!.count
    }
    
    func getcurrencyRate(location: Int) -> Rate {
        return self.currencyRatesArray![location]
        // return self.currencyRates!.count
    }

}


