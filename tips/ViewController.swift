//
//  ViewController.swift
//  tips
//
//  Created by Matt Hunter on 8/20/15.
//  Copyright (c) 2015 mh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var moneyLabel2: UILabel!
    @IBOutlet weak var splitControl: UISegmentedControl!
    @IBOutlet weak var splitTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        splitTotalLabel.text = "$0.00"
        
        self.billField.becomeFirstResponder()
        
    }
    
    override func viewDidAppear(animated: Bool) {
       moneyLabel2.hidden = false
        
        UIView.animateWithDuration(0.7, delay: 0.0, options: .CurveEaseOut, animations: {
            var moneyLabel2Frame = self.moneyLabel2.frame
            moneyLabel2Frame.origin.y -= 1000.0
            self.moneyLabel2.frame = moneyLabel2Frame
            
            }, completion: { finished in
                println("animation complete")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var splitNumbers = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]
        var splitNumber = splitNumbers[splitControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        var split:Double=(total/Double(splitNumber))
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        splitTotalLabel.text = String(format: "$%.2f", split)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

