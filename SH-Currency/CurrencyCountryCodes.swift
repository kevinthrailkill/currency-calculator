//
//  CurrencyCountryCodes.swift
//  SH-Currency
//
//  Created by Kevin Thrailkill on 2/21/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import UIKit

class CurrencyCountryCodes: NSObject {
    
    /// List of currency choices from the Fixer IO API

    private let currencyChoices : [String] = ["AUD", "BGN", "BRL", "CAD", "CHF", "CNY",
                                              "CZK", "DKK", "EUR", "GBP", "HKD", "HRK",
                                              "HUF", "IDR", "ILS", "INR", "JPY", "KRW",
                                              "MXN", "MYR", "NOK", "NZD", "PHP", "PLN",
                                              "RON", "RUB", "SEK", "SGD", "THB", "TRY",
                                              "USD", "ZAR"]
    
    func getCountryCodeCount() -> Int {
        return currencyChoices.count
    }
    
    func getCountryCode(location: Int) -> String {
        return currencyChoices[location]
    }

}
