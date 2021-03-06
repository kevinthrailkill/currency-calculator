//
//  CurrencyChangerPopupViewController.swift
//  SH-Currency
//
//  Created by Kevin Thrailkill on 2/17/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import UIKit



/// Choose Currency Protocol used for updating the base currency
protocol ChooseCurrencyProtocol : NSObjectProtocol {
    func updateCurrency(currency: String)
    
}


class CurrencyChangerPopupViewController: UIViewController {
    
    let currencyCodes : CurrencyCountryCodes = CurrencyCountryCodes()
    
    weak var delegate: ChooseCurrencyProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.showAnimate()

    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Animations for adding and removing the popup
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }

}



// MARK: - Currency Selector Table View
extension CurrencyChangerPopupViewController : UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currencyCodes.getCountryCodeCount()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currencySelectCell", for: indexPath)
     
     // Configure the cell...
        cell.textLabel?.text = currencyCodes.getCountryCode(location: indexPath.row)
     
        return cell
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt
        indexPath: IndexPath){
        
        self.removeAnimate()
        self.delegate?.updateCurrency(currency: currencyCodes.getCountryCode(location: indexPath.row))
        
    }

}
