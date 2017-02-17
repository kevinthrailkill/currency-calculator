//
//  CurrencyChangerPopupViewController.swift
//  SH-Currency
//
//  Created by Kevin Thrailkill on 2/17/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import UIKit



protocol ChooseCurrencyProtocol : NSObjectProtocol {
    func updateCurrency(currency: String)
    
}


class CurrencyChangerPopupViewController: UIViewController {
    
    
    /// List of currency choices from the Fixer IO API
    let currencyChoices : [String] = ["AUD", "BGN", "BRL", "CAD", "CHF", "CNY",
                                      "CZK", "DKK", "EUR", "GBP", "HKD", "HRK",
                                      "HUF", "IDR", "ILS", "INR", "JPY", "KRW",
                                      "MXN", "MYR", "NOK", "NZD", "PHP", "PLN",
                                      "RON", "RUB", "SEK", "SGD", "THB", "TRY",
                                      "USD", "ZAR"]
    
    weak var delegate: ChooseCurrencyProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        self.showAnimate()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
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

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



// MARK: - Currency Selector Table View
extension CurrencyChangerPopupViewController : UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return currencyChoices.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currencySelectCell", for: indexPath)
     
     // Configure the cell...
        cell.textLabel?.text = currencyChoices[indexPath.row]
     
        return cell
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt
        indexPath: IndexPath){
        
        print(currencyChoices[indexPath.row])
        self.removeAnimate()
        self.delegate?.updateCurrency(currency: currencyChoices[indexPath.row])
        
    }

}
