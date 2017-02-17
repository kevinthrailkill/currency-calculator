//
//  CurrencyDataController.swift
//  SH-Currency
//
//  Created by Kevin Thrailkill on 2/16/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import UIKit

class CurrencyDataController: NSObject {

    
    var currentCurrency : CurrencyRates?
    
    static let sharedInstance : CurrencyDataController = {
        let instance = CurrencyDataController()
        

        
        
        
        // setup code
        return instance
    }()
    
    
    /// Gets the currency info by calling the AF Wrapper
    ///
    /// - Parameter base: the base currency
    func getCurrencyFromFixer(base: String){
        AFCurrencyWrapper.requestGETURL(base, success: {
            (CurrencyRates) -> Void in
            
            self.currentCurrency = CurrencyRates
            
            print(CurrencyRates)
        }) {
            (error) -> Void in
            print(error)
        }
    }
    


}
