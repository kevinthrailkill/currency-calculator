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
    private var newBaseCurrency: Rate?
    private var selectedCurrency: Rate?
    private var currencyRates: Dictionary<String, NSNumber>?
    private var currencyRatesArray: [Rate]?
    
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
        self.currencyRatesArray = [Rate]()
        
        
        for item in result["rates"].dictionaryValue {
            
            let newRate = Rate.init(cs: item.key, cr: item.value.numberValue)
            self.currencyRatesArray?.append(newRate)
            
            let value = item.value.numberValue
            self.currencyRates?[item.key] = value
        }
    }
    
    
    // MARK: - Setting the base and selected currency
    
    func setBaseCurrency(baseCur: String){
        self.newBaseCurrency = Rate.init(cs: baseCur, cr: NSNumber.init(value: 1.0))
    }
    
    func setselectedCurrency(selCur: String, selRate: NSNumber){
        self.selectedCurrency = Rate.init(cs: selCur, cr: selRate)
    }
    
    
    
    // MARK: - Class getters
    
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
        return self.currencyRatesArray!.count
       // return self.currencyRates!.count
    }
    
    
    
}
