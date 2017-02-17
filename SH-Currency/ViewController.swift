//
//  ViewController.swift
//  SH-Currency
//
//  Created by Kevin Thrailkill on 2/16/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AFCurrencyWrapper.requestGETURL("USD", success: {
            (CurrencyRates) -> Void in
            print(CurrencyRates)
        }) {
            (error) -> Void in
            print(error)
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

