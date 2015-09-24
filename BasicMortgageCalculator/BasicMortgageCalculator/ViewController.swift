//
//  ViewController.swift
//  BasicMortgageCalculator
//
//  Created by Nathan Guy on 9/23/15.
//  Copyright © 2015 Nathan Guy. All rights reserved.
//

import UIKit
import Darwin

infix operator ** {}

func ** (num: Double, power: Double) -> Double{
    return pow(num, power)
}

class ViewController: UIViewController {

    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var rateTextField: UITextField!
    @IBOutlet weak var termTextField: UITextField!
    @IBOutlet weak var paymentRestultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateButton(sender: AnyObject) {
        print("Calculating...")
    }

}

