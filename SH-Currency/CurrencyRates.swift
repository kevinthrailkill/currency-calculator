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
    
    private var currencyList:[String] {
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
            let value = item.value.numberValue
            self.currencyRates?[item.key] = value
        }
    }
    
    func getCurrencyList() -> [String] {
        return self.currencyList
    }
    
    func getBaseCurrency() -> String {
        return self.baseCurrency!
    }
    
    func getcurrencyRates() -> Dictionary<String, NSNumber> {
        return self.currencyRates!
    }
    
    func getcurrencyRatesCount() -> Int {
        return self.currencyRates!.count
    }
    
    
}
