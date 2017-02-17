//
//  CurrencyCalculatorViewController.swift
//  SH-Currency
//
//  Created by Kevin Thrailkill on 2/17/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import UIKit

class CurrencyCalculatorViewController: UIViewController {
    
    
    let currencyDataController = CurrencyDataSource.sharedInstance
    
    @IBOutlet weak var selectedCurrencyTextField: UITextField!
    @IBOutlet weak var baseCurrencyTextField: UITextField!
    
    @IBOutlet weak var baseLabel: UILabel!
    
    @IBOutlet weak var selectedLabel: UILabel!
    
    @IBAction func baseTextFieldDidChange(_ sender: UITextField) {
        
        print(sender.text!)
        
        if(sender.text!.characters.count == 0){
            self.selectedCurrencyTextField.text = "0.00"
        }
        
        if sender.text!.characters.last != "." {
            currencyDataController.calulateExchange(exchangeAmount: sender.text!) {
                (result: String) in
                self.selectedCurrencyTextField.text = result
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up the textfields and labels
        baseCurrencyTextField.becomeFirstResponder()
        baseCurrencyTextField.delegate = self
        baseCurrencyTextField.text = "1.0"
        baseLabel.text = currencyDataController.getBaseCurrency()
        
        for (key, value) in currencyDataController.getSelectedCurrency() {
            selectedCurrencyTextField.text = String(format: "%10.2f", value.doubleValue)
            selectedLabel.text = key
            break
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension CurrencyCalculatorViewController : UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        }
        else {
            return true
        }
    }
    
}
