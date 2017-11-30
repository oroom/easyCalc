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
    var result: Double?
    var inputValue: Double = 0
    var nextOperation: CalculatorOperation?
    
    func nextNumber(_ nextNumber: Double) -> Double {
        if let nextOperation = nextOperation {
            switch nextOperation {
            case .plus:
                plus(inputValue, nextNumber)
            case .minus:
                minus(inputValue, nextNumber)
            case .multiply:
                multiply(inputValue, nextNumber)
            case .divide:
                divide(inputValue, nextNumber)
            }
            return result!
        }
        else {
            return inputValue
            }
    }
    
    func plus(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        result = firstNumber + secondNumber
        return result!
    }
    func minus(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        result = firstNumber - secondNumber
        return result!
    }
    func multiply(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        result = firstNumber * secondNumber
        return result!
    }
    func divide(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        if secondNumber != 0 {
            result = firstNumber / secondNumber
        }
        else {
            result = 0
        }
        return result!
    }
}
