//
//  Calculator.swift
//  Calculator
//
//  Created by Artsiom Sadyryn on 11/27/17.
//  Copyright © 2017 Dzmitry Novak. All rights reserved.
//

import Foundation

enum CalculatorOperation {
    case plus
    case minus
    case multiply
    case divide
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
        case .divide:
            divide(inputValue, nextNumber)
//        default:
//            fatalError("Something gone wrong with nextOpetation")
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
    func divide(_ firstNumber: Int, _ secondNumber: Int) -> Int? {
        if secondNumber != 0 {
            result = firstNumber / secondNumber
        }
        else {
            result = 0
        }
        return result!
    }
}
