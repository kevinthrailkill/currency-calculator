//
//  Rate.swift
//  SH-Currency
//
//  Created by Kevin Thrailkill on 2/21/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import UIKit

class Rate: NSObject {
    
    private let currencyString : String?
    private let currencyRate : NSNumber?
    
    init(cs: String, cr: NSNumber) {
        self.currencyString = cs
        self.currencyRate = cr
    }
    
    func getCurrencyString() -> String {
        return self.currencyString!
    }
    
    func getCurrencyRate() -> NSNumber {
        return self.currencyRate!
    }

}
