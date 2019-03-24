//
//  MainViewController.swift
//  app-window shopper
//
//  Created by Aman Meena on 23/03/19.
//  Copyright © 2019 Aman Meena. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: Outlets
    /*****************************************************************/
    @IBOutlet weak var hourlyWageTextField: CurrencyTextField!
    @IBOutlet weak var itemPriceTextField: CurrencyTextField!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var clearCalculatorButton: UIButton!
    
    // MARK: Actions
    /*****************************************************************/
    @IBAction func onClearTapped(_ sender: Any) {
        resultsLabel.isHidden = true
        hoursLabel.isHidden = true
        
        hourlyWageTextField.text = ""
        itemPriceTextField.text = ""
    }
    
    @objc func calculate() {
        if let wageTxt = hourlyWageTextField.text, let priceTxt = itemPriceTextField.text {
            if let wage = Double(wageTxt), let price = Double(priceTxt) {
                view.endEditing(true)
                let hours = Wage.getHours(forWage: wage, andPrice: price)
                if hours <= 1 {
                    hoursLabel.text = "hour"
                }
                hoursLabel.isHidden = false
                resultsLabel.isHidden = false
                resultsLabel.text = String(hours)
            }
        }
    }
    
     /*****************************************************************/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calculateButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60))
        calculateButton.setTitle("Calculate", for: .normal)
        calculateButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        calculateButton.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        calculateButton.addTarget(self, action: #selector(MainViewController.calculate), for: .touchUpInside)
        
        hourlyWageTextField.inputAccessoryView = calculateButton
        itemPriceTextField.inputAccessoryView = calculateButton
        
        resultsLabel.isHidden = true
        hoursLabel.isHidden = true
    }
}

