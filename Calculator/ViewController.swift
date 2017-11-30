//
//  ViewController.swift
//  Calculator
//
//  Created by oroom on 11/24/17.
//  Copyright © 2017 Dzmitry Novak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var calc = Calcucator()
    
    @IBOutlet weak var resultArea: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func operationButtonTapped(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        
        calc.inputValue = Double(resultArea.text!)!
        switch button.titleLabel!.text! {
        case "+":
            calc.nextOperation = .plus
        case "-":
            calc.nextOperation = .minus
        case "x":
            calc.nextOperation = .multiply
        case "/":
                calc.nextOperation = .divide
        default:
            ()
        }
        resultArea.text = "0"
    }
    
    @IBAction func resultButtonTapped(_ sender: Any) {
        if let number = resultArea?.text, let numberForNext = Double(number) {
            calc.nextNumber(numberForNext)
            if calc.nextOperation == CalculatorOperation.divide && numberForNext == 0 {
                resultArea.text = "Error"
            }
            else {
                resultArea.text = String(calc.result!)
                calc.nextOperation = nil
            }
        }
    }
    
    @IBAction func eraseButtonTapped(_ sender: Any) {
        resultArea.text = "0"
    }
    
    
    @IBAction func didgitButtonTapped(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        
        if let buttonText = button.titleLabel?.text, var resultText = resultArea?.text {
            if resultText == "0" {
            resultText = buttonText
            }
            else {
                resultText += buttonText
            }
            resultArea.text = resultText
      }  
    }
}
