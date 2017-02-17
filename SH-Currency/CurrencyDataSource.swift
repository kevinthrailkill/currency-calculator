//
//  CurrencyDataSource.swift
//  SH-Currency
//
//  Created by Kevin Thrailkill on 2/16/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import UIKit

class CurrencyDataSource: NSObject {
    
    
    private var currentCurrency : CurrencyRates?
    
    static let sharedInstance : CurrencyDataSource = {
        let instance = CurrencyDataSource()
        
        // setup code
        return instance
    }()
    
    
    /// Gets the currency info by calling the AF Wrapper
    ///
    /// - Parameter base: the base currency
    func getCurrencyFromFixer(base: String, completion: @escaping ()->Void){
        AFCurrencyWrapper.requestGETURL(base, success: {
            (CurrencyRates) -> Void in
            
            self.currentCurrency = CurrencyRates
            print(CurrencyRates)
            completion()
        }) {
            (error) -> Void in
            print(error)
        }
    }
    
    func getCurrencyCount() -> Int {
        if(currentCurrency != nil){
            return currentCurrency!.getcurrencyRatesCount()
        }
        return 0
    }
    
    func getCurrencyList() -> [String] {
        if(currentCurrency != nil){
            return currentCurrency!.getCurrencyList()
        }
        return [String]()
    }
    
    func getCurrencyRates() -> Dictionary<String, NSNumber> {
        if(currentCurrency != nil){
            return currentCurrency!.getcurrencyRates()
        }
        return [String: NSNumber]()
    }
    
    func getBaseCurrency() -> String {
        if(currentCurrency != nil){
            return currentCurrency!.getBaseCurrency()
        }
        return ""
    }


}
