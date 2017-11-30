//
//  ViewController.swift
//  Calculator
//
//  Created by oroom on 11/24/17.
//  Copyright © 2017 Dzmitry Novak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultArea: UILabel!
    var calc = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didgitButtonTapped(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        
        
        if let buttonText = button.titleLabel?.text , var resultText = resultArea?.text{
            if resultText == "0" {
                resultText = buttonText
            }
            else {
                resultText += buttonText
            }
            resultArea.text = resultText
        }
        
        
    }
    
    
    @IBAction func operationTapped(_ sender: Any) {
        guard  let button = sender as? UIButton else {
            return
        }
        if let number = resultArea?.text, let inputValue = Int(number){
            calc.inputValue = inputValue
        if  let buttonText = button.titleLabel?.text{
            switch buttonText {
            case "-":
                calc.operation = .substract
            case "+":
                calc.operation = .addition
            case "×":
                calc.operation = .multi
            default:
                return ()
            }
        }
        }
        resultArea.text = "0"
    }
    
    
    @IBAction func resultCalc(_ sender: Any) {
        let nextNumber = Int(resultArea.text!)
        resultArea.text = String(calc.nextNumber(nextNumber!))
        
        
    }
    
    
    
    @IBAction func cleanResult(_ sender: Any) {
        resultArea.text = "0"
    }
    
}



