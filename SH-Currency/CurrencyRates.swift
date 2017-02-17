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
    
    private var baseCurrency: String?
    private var currencyRates: Dictionary<String, NSNumber>?
    
    var currencyList:[String] {
        get{
            return [String](currencyRates!.keys)
        }
    }
    
    
    /// Parses the Swifty JSON and creates a new Currency Rate Object
    ///
    /// - Parameter result: json input from GET Call
    init(result: JSON){
        
        self.baseCurrency = result["base"].rawString()!
        self.currencyRates = [String:NSNumber]()
        
        for item in result["rates"].dictionaryValue {
            
            print(item)
            let value = item.value.numberValue
            self.currencyRates?[item.key] = value
            
        }
        
    }
    
    
    func getBaseCurrency() -> String {
        return self.baseCurrency!
    }
    
    func getcurrencyRates() -> Dictionary<String, NSNumber> {
        return self.currencyRates!
    }
    
    func getcurrencyRatesCount() -> Int {
        
        if let currencyCount = self.currencyRates?.count {
            return currencyCount
        } else {
            return 0
        }
        

    }
    
    
}
