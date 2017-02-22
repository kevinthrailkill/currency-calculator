//
//  CurrencyTableViewController.swift
//  SH-Currency
//
//  Created by Kevin Thrailkill on 2/16/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import UIKit
import SVProgressHUD

class CurrencyTableViewController: UITableViewController {

    private var viewHasBeenSet = false
    var currencyRates : CurrencyRates?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        
        if (!self.viewHasBeenSet) {
            // Perform whatever code you'd like to perform
            // the first time viewDidAppear is called
            
            showCurrencyPopup()
            self.viewHasBeenSet = true;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - PopoverControl
    func showCurrencyPopup() {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpID") as! CurrencyChangerPopupViewController
        popOverVC.delegate = self
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    func clickChangeCurrencyButton(button: UIButton) {
        showCurrencyPopup()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if(segue.identifier! == "calcViewSegue"){
            let path = self.tableView.indexPathForSelectedRow!
            let rate : Rate = self.currencyRates!.getcurrencyRate(location: path.row)
            let currencyCalc = CurrencyCalculations.init(selectedCur: rate, baseCur: self.currencyRates!.getBaseCurrency())
            
            let calculator =  segue.destination as! CurrencyCalculatorViewController
            calculator.currencyCalc = currencyCalc
            
        }
        

        
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(currencyRates != nil){
            return self.currencyRates!.getcurrencyRatesCount()
        }
        return 0
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCell", for: indexPath)

        let rate : Rate = self.currencyRates!.getcurrencyRate(location: indexPath.row)
        
        cell.textLabel?.text = rate.getCurrencyString()
        cell.detailTextLabel?.text = String(format: "%10.2f", rate.getCurrencyRate().floatValue)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt
        indexPath: IndexPath){
        

    }
    
}


// MARK: - Protocol Updates the current currency rates being displayed in the table
extension CurrencyTableViewController : ChooseCurrencyProtocol {
    func updateCurrency(currency: String){
        SVProgressHUD.show(withStatus: "Getting Currency Data")
        
        
        AFCurrencyWrapper.requestGETURL(currency, success: {
            (CurrencyRates) -> Void in
            
            let button =  UIButton(type: .custom)
            button.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
            button.backgroundColor = UIColor.black
            button.setTitle(currency, for: .normal)
            button.addTarget(self, action: #selector(self.clickChangeCurrencyButton), for: .touchUpInside)
            self.navigationItem.titleView = button
            
            self.currencyRates = CurrencyRates
            self.tableView.reloadData()
            SVProgressHUD.dismiss()

        }) {
            (error) -> Void in
            print(error)
        }
        
    }
}
