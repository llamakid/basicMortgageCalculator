//
//  ViewController.swift
//  BasicMortgageCalculator
//
//  Created by Nathan Guy on 9/29/15.
//  Copyright © 2015 Nathan Guy. All rights reserved.
//

import UIKit
import Darwin

// infix & func ** are for exponent use
infix operator ** {}

func ** (num: Double, power: Double) -> Double{
    return pow(num, power)
}

class ViewController: UIViewController, UITextFieldDelegate {

    // setting all IBOutlets
    @IBOutlet weak var loanAmountTextField: UITextField!
    @IBOutlet weak var rateTextField: UITextField!
    @IBOutlet weak var termSegmentedController: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    
    // setting all vars
    var loanAmount = 0.00
    var loanRate = 0.00
    var loanTerm = 180.00
    
    var p = 250000.00
    var i = 0.004167
    var n = 360.00
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // dismissing the keyboard on touch of viewController
        let tap: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        //dismissing keyboard via done button
        self.loanAmountTextField.delegate = self;
        self.rateTextField.delegate = self;
        
        // setting default values in text fields & result label
        loanAmountTextField.text = "250000"
        rateTextField.text = "4.16"
        resultLabel.text = " "
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // Action to change the term with the segmented controller
    @IBAction func segmentedControllerAction(sender: AnyObject) {
        let selectedIndex = termSegmentedController.selectedSegmentIndex
        
        if(selectedIndex == 0) {
            loanTerm = 180.00
            //print("Loan Term is \(loanTerm)")
        }else if(selectedIndex == 1) {
            loanTerm = 360.00
            //print("Loan Term is \(loanTerm)")
        }
    }
    
    // calculate payment on tap of calculate button
    @IBAction func calculateButtonAction(sender: AnyObject) {
        
        n = loanTerm
        p = (loanAmountTextField.text as! NSString).doubleValue
        i = (rateTextField.text as! NSString).doubleValue
        i = i/100
        i = i/12
        print(i)
        
        let first = (1+i)**n
        let second = first * i
        let third = p * second
        let fourth = first - 1
        var fith = third/fourth
        
        fith = round(fith)
        
        print(fith)
        
        resultLabel.text = "\(fith)"
        
    }
    
    
    // on tap dismiss function
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // done button dismiss keyboard funtion
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    


}

