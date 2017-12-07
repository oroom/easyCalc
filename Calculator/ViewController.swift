//
//  ViewController.swift
//  Calculator
//
//  Created by oroom on 11/24/17.
//  Copyright © 2017 Dzmitry Novak. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    var calc = Calculator()
    
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
        guard let button = sender as? UIButton else {
            return
        }
        
        if let buttonText = button.titleLabel?.text, var resultAreaText = resultArea?.text {
            if resultAreaText == "0" {
                resultAreaText = buttonText
            }
            else {
                resultAreaText += buttonText
            }
            resultArea.text = resultAreaText
        }
    }
    
    @IBAction func eraseButtonTapped(_ sender: Any) {
        resultArea.text = "0"
    }
    
    @IBAction func resultButtonTapped(_ sender: Any) {
        if let tempResultNumber = resultArea?.text, let resultNumber = Double(tempResultNumber) {
            //calc.nextNumber(resultNumber) //я сомневаюсь, что здесь нужно повторение
            if calc.nextOperation == CaclutorOperation.division && resultNumber == 0 {
                resultArea.text = "Error"
            }
            else {
                calc.nextNumber(resultNumber)
                resultArea.text = String(calc.result)
            }
        }
    }
    
    @IBAction func operationWithButtonTapped(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        if let tempInputValueButton = resultArea?.text, let inputValueButton = Double(tempInputValueButton), let buttonText = button.titleLabel?.text {
            calc.inputValue = inputValueButton
            switch buttonText {
            case "+":
                calc.nextOperation = .plus
            case "-":
                calc.nextOperation = .minus
            case "×":
                calc.nextOperation = .multiplie
            case "÷":
                calc.nextOperation = .division
            default:
                resultArea.text = "Error"
            }
        }
        resultArea.text = "0"
    }
    
    @IBAction func operationWithResultButtonTapped(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        if let tempInputTempValueButton = resultArea?.text, let inputValueButton = Double(tempInputTempValueButton) {
            calc.inputValue = inputValueButton
            if let tempResultValueButton = resultArea?.text, let resultValueButton = Double(tempResultValueButton), let buttonText = button.titleLabel?.text {
                switch buttonText {
                case "±":
                    calc.nextOperation = .plusMinus
                case "√":
                    calc.nextOperation = .sqrt
                case "x²":
                    calc.nextOperation = .doublle
                default:
                    resultArea.text = "Error"
                }
                calc.nextNumber(resultValueButton)
                resultArea.text = String(calc.result)
            }
        }
    }
}
