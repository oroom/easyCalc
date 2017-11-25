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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    enum CalculatorOperation {
        case plus
        case minus
        case multiply
    }
    
    class Calcucator {
        var result: Int?
        var inputValue: Int = 0
        var nextOperation: CalculatorOperation?
        
        func nextNumber(_ nextNumber: Int) -> Int {
            switch nextOperation! {
            case .plus:
                plus(inputValue, nextNumber)
            case .minus:
                minus(inputValue, nextNumber)
            case .multiply:
                multiply(inputValue, nextNumber)
            default:
                fatalError("Something gone wrong with nextOpetation")
            }
//            nextOperation = nil
//            inputValue = result!
            return result!
        }
        
        func plus(_ firstNumber: Int, _ secondNumber: Int) -> Int {
            result = firstNumber + secondNumber
            return result!
        }
        func minus(_ firstNumber: Int, _ secondNumber: Int) -> Int {
            result = firstNumber - secondNumber
            return result!
        }
        func multiply(_ firstNumber: Int, _ secondNumber: Int) -> Int {
            result = firstNumber * secondNumber
            return result!
        }
    }

    @IBAction func operationButtonTapped(_ sender: Any) {
        let button = sender as! UIButton
        let calc = Calcucator()
        let numberForInput = Int(resultArea.text!)
        calc.inputValue = numberForInput!
        switch button.titleLabel!.text! {
        case "+":
            calc.nextOperation = .plus
        case "-":
            calc.nextOperation = .minus
        case "x":
            calc.nextOperation = .multiply
        default:
            fatalError("Something gone wrong with =")
        }
        resultArea.text = ""
    }
    
    @IBAction func resultButtonTapped(_ sender: Any) {
        let calc = Calcucator()
        let numberForNext = Int(resultArea.text!)
        calc.nextNumber(numberForNext!)
        resultArea.text = String(calc.result!)
        calc.nextOperation = nil
    }
    
    
    @IBAction func didgitButtonTapped(_ sender: Any) {
        let button = sender as! UIButton
        let buttonText = button.titleLabel!.text!
        //let calc = Calcucator()
        if resultArea.text! == "0" {
            resultArea.text! = buttonText
        }
        else {
            resultArea.text! += buttonText
        }
        
    }
}

