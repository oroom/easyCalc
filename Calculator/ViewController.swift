//
//  ViewController.swift
//  Calculator
//
//  Created by oroom on 11/24/17.
//  Copyright © 2017 Dzmitry Novak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var cal = Calculator()
    @IBOutlet weak var resultArea: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didgitButtonTapped(_ sender: Any) {
        guard let button = sender as? UIButton else{
            return
        }
        let buttonText = button.titleLabel!.text!
        if resultArea.text! == "0" {
            resultArea.text! = buttonText
        }
        else {
            resultArea.text! += buttonText
        }
        
    }
    @IBAction func operationButtonTapped(_ sender: Any) {
        let button = sender as! UIButton
        let buttonForInput = Double(resultArea.text!)
        cal.inputValue = buttonForInput!
        switch button.titleLabel!.text!{
        case "+":
            cal.nextOperation = .plus
        case "-":
            cal.nextOperation = .minus
//        case "x^2"?:
//            cal.nextOperation = .doublle
//        case "sqrt"?:
//            cal.nextOperation = .sqrt
        case "*":
            cal.nextOperation = .multiplie
        case "/":
            cal.nextOperation = .division
//        case "+-"?:
//            cal.nextOperation = .plusMinus
        default :
            fatalError()
        }
        resultArea.text = "0"
    }
    @IBAction func resultButtonTapped(_ sender: Any) {
        guard let numberForNext = Double(resultArea.text!) else {
            return
        }
        cal.nextNumber(numberForNext)
        resultArea.text = String(cal.result!)
        
    }
    @IBAction func eraseButtonTapped(_ sender: Any) {
        resultArea.text = "0"
        
    }

    @IBAction func operationSqrtButtonTapped(_ sender: Any) {
        let button = sender as! UIButton
        let numberForNext = Double(resultArea.text!)
        let buttonForInput = Double(resultArea.text!)
        cal.inputValue = buttonForInput!
        switch button.titleLabel!.text!{
        case "x^2":
            cal.nextOperation = .doublle
        case "sqrt":
            cal.nextOperation = .sqrt
        case "+-":
            cal.nextOperation = .plusMinus
        default :
            fatalError()
        }
        cal.nextNumber(numberForNext!)
        resultArea.text = String(cal.result!)
    }
}

