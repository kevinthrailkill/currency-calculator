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

    let currencyDataController = CurrencyDataSource.sharedInstance
    private var viewHasBeenSet = false
    
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
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyDataController.getCurrencyCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCell", for: indexPath)

        
        let myRowKey = currencyDataController.getCurrencyList()[indexPath.row] //the dictionary key
        cell.textLabel?.text = myRowKey
        let myRowData = currencyDataController.getCurrencyRates()[myRowKey]! //the dictionary value
        cell.detailTextLabel?.text = String(format: "%10.2f", myRowData.floatValue)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt
        indexPath: IndexPath){
        
        let myRowKey = currencyDataController.getCurrencyList()[indexPath.row]
        let myRowData = currencyDataController.getCurrencyRates()[myRowKey]!
        currencyDataController.setSelectedCurrency(key: myRowKey, value: myRowData)
        
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


// MARK: - Protocol Updates the current currency rates being displayed in the table
extension CurrencyTableViewController : ChooseCurrencyProtocol {
    func updateCurrency(currency: String){
        SVProgressHUD.show(withStatus: "Getting Currency Data")
        currencyDataController.getCurrencyFromFixer(base: currency) {
            print("Got to callback")
            
            let button =  UIButton(type: .custom)
            button.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
            button.backgroundColor = UIColor.black
            button.setTitle(self.currencyDataController.getBaseCurrency(), for: .normal)
            button.addTarget(self, action: #selector(self.clickChangeCurrencyButton), for: .touchUpInside)
            self.navigationItem.titleView = button
            
            self.tableView.reloadData()
            SVProgressHUD.dismiss()
        }
    }
}
