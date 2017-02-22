//
//  AFCurrencyWrapper.swift
//  SH-Currency
//
//  Created by Kevin Thrailkill on 2/16/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//
//
// Wrapper class for Alamo Fire and Swifty JSON
// Modeled after https://gist.github.com/ashishkakkad8/94edb68144f7d93ecc10

import UIKit
import Alamofire
import SwiftyJSON


class AFCurrencyWrapper: NSObject {
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - strURL: the url of the site
    ///   - success: returns a new currency rates object
    ///   - failure: returns an error
    class func requestGETURL(_ baseCur: String, success:@escaping (CurrencyRates) -> Void, failure:@escaping (Error) -> Void) {
        
        
        let fixerURL : String = "http://api.fixer.io/latest?base=" + baseCur
        
        Alamofire.request(fixerURL).responseJSON { (responseObject) -> Void in
            
            print(responseObject)
            
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                
                let currentCurrency : CurrencyRates = CurrencyRates(result: resJson)
                
                success(currentCurrency)
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }

}
