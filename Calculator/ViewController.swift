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
        // Do any additional setup after loading the view, typically from a nib
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didgitButtonTapped(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        let buttonText = button.titleLabel!.text
        if resultArea.text == "0" {
            resultArea.text = buttonText
        }
        else {
            resultArea.text! += buttonText!
        }
    }
    
    @IBAction func eraseButtonTapped(_ sender: Any) {
        resultArea.text = "0"
    }
    
    @IBAction func resultButtonTapped(_ sender: Any) {
        if let resultNumber = Double(resultArea.text!) {
        calc.nextNumber(resultNumber)
            if calc.nextOperation == CaclutorOperation.division && resultNumber == 0 {
                resultArea.text = "Error"
            }
            else{
                calc.nextNumber(resultNumber)
                resultArea.text = String(calc.result!)
            }
        }
    }
    
    @IBAction func operationWithButtonTapped(_ sender: Any) {
        let button = sender as! UIButton
        let inputValueButton = Double(resultArea.text!)
        calc.inputValue = inputValueButton!
        switch button.titleLabel!.text!{
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
        resultArea.text = "0"
    }
    
    @IBAction func copyButton() {
        UIPasteboard.general.string = resultArea.text
    }
    
    @IBAction func operationWithResultButtonTapped(_ sender: Any) {
        let button = sender as! UIButton
        let inputValueButton = Double(resultArea.text!)
        calc.inputValue = inputValueButton!
        let resultValueButton = Double(resultArea.text!)
        switch button.titleLabel!.text!{
        case "±":
            calc.nextOperation = .plusMinus
        case "√":
            calc.nextOperation = .sqrt
        case "x²":
            calc.nextOperation = .doublle
        case "sin":
            calc.nextOperation = .sinus
        case "cos":
            calc.nextOperation = .cosinus
        case "tg":
            calc.nextOperation = .tangens
        case "log":
            calc.nextOperation = .log
        default:
            resultArea.text = "Error"
        }
        calc.nextNumber(resultValueButton!)
        resultArea.text = String(calc.result!)
    }
}
    
    


