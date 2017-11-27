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
    //var calc = Calcucator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func operationButtonTapped(_ sender: Any) {
        let button = sender as! UIButton
        let numberForInput = Int(resultArea.text!)
        calc.inputValue = numberForInput!
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
            fatalError("Something gone wrong with =")
        }
        resultArea.text = "0"
    }
    
    @IBAction func resultButtonTapped(_ sender: Any) {
        let numberForNext = Int(resultArea.text!)
        calc.nextNumber(numberForNext!)
        resultArea.text = String(calc.result!)
        //calc.nextOperation = nil
    }
    
    @IBAction func eraseButtonTapped(_ sender: Any) {
        resultArea.text = "0"
    }
    
    
    @IBAction func didgitButtonTapped(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        
        if let buttonText = button.titleLabel?.text, var resultText = resultArea?.text {
        //let calc = Calcucator()
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
